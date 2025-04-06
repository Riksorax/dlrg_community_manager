import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/data/models/memberCheckIn.dart';
import '../../shared/providers/firebase_repository.provider.dart';
import '../excel_import/excel_import.notifier.dart';
import '../nfc/nfc_write.notifier.dart';
import '../pdf_template/pdf_template.notifier.dart';
import '../printer/print_pdf_template.notifier.dart';

part 'update_member.notifier.g.dart';

@riverpod
class UpdateMemberNotifier extends _$UpdateMemberNotifier {
  @override
  Member build()  {
    return Member(
      "",
      "",
      "",
      "",
      false,
      [],
    );
  }

  void getNextMember(List<Member> memberList) {
    for (var element in memberList) {
      if (!element.memberCardDone) {
        state = element;
        break;
      }
    }
  }

  void updateMemberCardDone() {
      if (!state.memberCardDone) {
        state.memberCardDone = true;
        ref.read(excelImportNotifierProvider.notifier).updateMemberList(state);
        ref.read(SaveMemberRepoProvider(state));
      }
    final nextMemberList = ref.read(excelImportNotifierProvider);
    ref
        .read(updateMemberNotifierProvider.notifier)
        .getNextMember(nextMemberList);
    ref.read(pdfTemplateProvider.notifier).fillPlaceholderPDF();
    ref.read(nfcWriteNotifierProvider.notifier).resteState();
    ref.read(printPdfTemplateNotifierProvider.notifier).resteState();
  }
}
