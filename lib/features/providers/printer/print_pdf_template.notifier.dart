import 'dart:io';

import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pdf_template/pdf_template.notifier.dart';

part 'print_pdf_template.notifier.g.dart';

@riverpod
class PrintPdfTemplateNotifier extends _$PrintPdfTemplateNotifier {
  @override
  bool build() {
    return false;
  }

  void printPdf() async {
    final pdfTemplatePath = ref.read(pdfTemplateProvider);
    var file = await File(pdfTemplatePath).exists();
    if (!file){
      return;
    }
    try {
      final pdfData = File(pdfTemplatePath).readAsBytesSync();

      await Printing.layoutPdf(
        onLayout: (format) async => pdfData,
      );

      state = true;
      // Falls kein Fehler auftritt, kann der Druck als erfolgreich angenommen werden
      print('Druckauftrag erfolgreich gesendet.');
    } catch (e) {
      print('Es ist ein Fehler aufgetreten: $e');
      state = false;
    }
  }

  void resteState(){
    state = false;
  }

}
