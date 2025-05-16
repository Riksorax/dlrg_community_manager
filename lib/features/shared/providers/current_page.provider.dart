import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_page.provider.g.dart';

@riverpod
class CurrentPageNotifier extends _$CurrentPageNotifier {
  @override
  int build() => 0;

  void setCurrentPage(int currentPage) {
    state = currentPage;
  }
}
