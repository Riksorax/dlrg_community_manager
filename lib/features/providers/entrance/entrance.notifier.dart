import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/providers/firebase_repository.provider.dart';
import '../update_member/update_member_check_in.notifier.dart';

part 'entrance.notifier.g.dart';

@riverpod
class EntranceNotifier extends _$EntranceNotifier {
  @override
  List<Member> build() {
    List<Member> members = [];
    return members;
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
