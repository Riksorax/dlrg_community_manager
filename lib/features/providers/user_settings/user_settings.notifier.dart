import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/auth.dart';
import '../../shared/providers/firebase_repository.provider.dart';

part 'user_settings.notifier.g.dart';

@riverpod
class UserSettingsNotifier extends _$UserSettingsNotifier {
  @override
  Future<List<Auth>> build() async {
    return _getAllUsers();
  }

  Future<List<Auth>> _getAllUsers() async =>
      await ref.read(getListAuthRepoProvider.future);

  void updateUser(Auth auth) async{
    try{
      ref.read(updateAuthProvider(auth));

      // 3. Aktualisiere den Zustand mit den neuen Daten
      final updatedUsers = await _getAllUsers();
      state = AsyncValue.data(updatedUsers); // Korrekte Zuweisung
    }catch(e){
      print(e);
    }
  }
}
