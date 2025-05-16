import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/memberCheckIn.dart';
import 'update_member.notifier.dart';

part 'update_member_check_in.notifier.g.dart';

@riverpod
class UpdateMemberCheckInNotifier extends _$UpdateMemberCheckInNotifier {
  @override
  MemberCheckIn build() => MemberCheckIn(
        DateTime.now(),
        false,
        false,
      );

  void setCheckIn() {
    var memberCheckIn = MemberCheckIn(
      DateTime.now(),
      true,
      false,
    );
    state = memberCheckIn;
  }
}
