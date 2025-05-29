import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/providers/firebase_repository.provider.dart';

part 'search_member.notifier.g.dart';

@riverpod
class SearchMemberNotifierAsync extends _$SearchMemberNotifierAsync {
  @override
  FutureOr<List<Member>> build() async {
    final searchText = ref.watch(searchTextNotifierProvider);

    var members = await ref.watch(searchMemberProvider(searchText).future);

    return members;
  }
}

@riverpod
class SearchTextNotifier extends _$SearchTextNotifier {
  @override
  String build() => "";

  void setText(String text) {
    state = text;
  }
}
