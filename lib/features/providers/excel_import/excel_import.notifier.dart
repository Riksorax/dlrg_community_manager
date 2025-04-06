import 'dart:io';

import 'package:excel/excel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../pdf_template/pdf_template.notifier.dart';
import '../update_member/update_member.notifier.dart';

part 'excel_import.notifier.g.dart';

@riverpod
class ExcelImportNotifier extends _$ExcelImportNotifier {
  @override
  List<Member> build() {
    return List<Member>.empty();
  }

  void getExcelImport(String filePaths) {
    var bytes = File(filePaths).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    List<Member> listMembers = [];
    for (var value in excel.tables.keys) {
      for (var row in excel.tables[value]!.rows.skip(1)) {
        late Member member = Member(
          row[0]!.value.toString(),
          row[1]!.value.toString(),
          row[2]!.value.toString(),
          row[3]!.value.toString(),
          false,
          List.empty(),
        );

        listMembers.add(member);
      }
    }
    state = listMembers;
    ref.read(updateMemberNotifierProvider.notifier).getNextMember(state);
    ref.read(pdfTemplateProvider.notifier).fillPlaceholderPDF();
  }

  void updateMemberList(Member member) {
    state
        .where(
          (element) => element.memberNumber == member.memberNumber,
    )
        .first
        .memberCardDone = member.memberCardDone;
  }
}
