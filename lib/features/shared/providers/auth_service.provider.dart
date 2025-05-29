import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/auth.dart';
import 'firebase_repository.provider.dart';
import 'user_service.provider.dart';

part 'auth_service.provider.g.dart';

@riverpod
class AuthServiceNotifier extends _$AuthServiceNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  AsyncValue<User?> build() => const AsyncValue.data(null); // Initialzustand ist Loading

  Future<User?> signInWithGoogle() async {
    state = const AsyncLoading(); // Korrekt: Setze den Zustand auf Loading
    try {

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        state = const AsyncData(null); // Falls der Nutzer abbricht
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      var userUid = userCredential.user!.uid;
      var getAuth = await ref.read(GetAuthRepoProvider(userUid).future);
      if (getAuth == null) {
        var authUser = Auth(UserData(status: AuthStatus.pending, name: userCredential.user!.displayName!, mail: userCredential.user!.email!, localGroup: "Weeze", userUid: userUid), Role.member);
        await ref.read(SetAuthRepoProvider(authUser).future);
        state = AsyncError("Account muss noch bestätigt werden.", StackTrace.current); // Falls der Nutzer abbricht
        return null;
      }
      if (getAuth.user.status == AuthStatus.pending) {
        state = AsyncError("Account noch nicht bestätigt.", StackTrace.current); // Falls der Nutzer abbricht
        return null;
      }
      ref.read(userServiceNotifierProvider.notifier).getUser(userUid);
      state = AsyncData(userCredential.user); // Korrekt: Setze den Zustand auf Data
      return userCredential.user;
    } catch (e, st) {
      state = AsyncError("Account muss noch bestätigt werden.", st); // Korrekt: Setze den Zustand auf Error
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading(); // Korrekt: Setze den Zustand auf Loading
    await _auth.signOut();
    await GoogleSignIn().signOut();
    state = const AsyncData(null); // Korrekt: Setze den Zustand auf Data (null)
  }
}
