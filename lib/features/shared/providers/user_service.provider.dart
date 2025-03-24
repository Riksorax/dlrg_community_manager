import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/auth.dart';
import 'firebase_repository.provider.dart';

part 'user_service.provider.g.dart';

@riverpod
class UserServiceNotifier extends _$UserServiceNotifier {
  @override
  Future<Auth?> build() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await ref.read(GetAuthRepoProvider(user.uid).future);
    }
    return null;
  }

  Future<void> getUser(String userUid) async {
    state = const AsyncLoading(); // Setze den State auf Loading, während der Benutzer geladen wird
    try {
      var user = await ref.read(GetAuthRepoProvider(userUid).future);
      state = AsyncData(user); // Setze den State auf Data, wenn der Benutzer erfolgreich geladen wurde
      print("State nach setzten: $state");
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace); // Setze den State auf Error, wenn ein Fehler auftritt
    }
  }

  void setUser(UserCredential userCredential, String userUid) {
    var authUser = Auth(
      UserData(
          status: AuthStatus.pending,
          name: userCredential.user!.displayName!,
          mail: userCredential.user!.email!,
          localGroup: "Weeze",
          userUid: userUid),
      Role.member,
    );
    ref.read(SetAuthRepoProvider(authUser));
    state = AsyncValue.data(authUser);
  }
}
