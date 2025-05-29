import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/providers/firebase_repository.provider.dart';
import '../update_member/update_member_check_in.notifier.dart';
import 'search_member.notifier.dart';

part 'entrance.notifier.g.dart';

@riverpod
class EntranceNotifier extends _$EntranceNotifier {
  @override
  List<Member> build() => loadEntranceList();

  List<Member> loadEntranceList() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    final asyncMembers = ref.watch(searchMemberNotifierAsyncProvider);

    // Behandeln Sie die verschiedenen Zustände von AsyncValue
    return asyncMembers.when(
      data: (members) {
        // Filtern Sie die Mitgliederliste
        final filteredMembers = members.where((member) {
          // Überprüfen Sie, ob einer der Check-Ins des Mitglieds mit dem heutigen Datum übereinstimmt
          return member.memberCheckIn.any((checkIn) {
            DateTime checkInDateWithoutTime = DateTime(
              checkIn.checkInDate.year,
              checkIn.checkInDate.month,
              checkIn.checkInDate.day,
            );
            return checkInDateWithoutTime.isAtSameMomentAs(date);
          });
        }).toList();
        return filteredMembers;
      },
      loading: () {
        // Optional: Behandeln Sie den Ladezustand, z.B. eine leere Liste zurückgeben oder einen Ladeindikator anzeigen
        print("Lade Mitglieder...");
        return []; // Oder eine andere geeignete Reaktion
      },
      error: (error, stackTrace) {
        // Optional: Behandeln Sie den Fehlerzustand
        print("Fehler beim Laden der Mitglieder: $error");
        return []; // Oder eine andere geeignete Reaktion
      },
    );
  }

  void addEntranceList(Member member) {
    var memberCheckIn = ref.read(updateMemberCheckInNotifierProvider);
    if (!checkMemberNumber(member, memberCheckIn.checkInDate)) {
      member.memberCheckIn.add(memberCheckIn);
      state = [...state, member];
    }
  }

  bool checkMemberNumber(Member member, DateTime checkInDate) {
    return state.any((element) =>
        element.memberNumber == member.memberNumber);
  }

  void updateMember(String memberNumber, bool payed, int index) {
    var member =
        state.firstWhere((element) => element.memberNumber == memberNumber);
    var memberCheckIn = member.memberCheckIn[index];
    memberCheckIn.payed = payed;
    ref.read(UpdateMemberRepoProvider(member, index));
    state = [...state];
  }

  void clearEntranceList() {
    print("state ist leer");
    state = []; // Leere die Liste
  }
}
