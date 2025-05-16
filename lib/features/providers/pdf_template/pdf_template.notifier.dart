import 'dart:io';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../file_picker/file_picker.provider.dart';
import '../update_member/update_member.notifier.dart';
part 'pdf_template.notifier.g.dart';

@riverpod
class PdfTemplate extends _$PdfTemplate {
  @override
  String build() {
    return "";
  }

  Future<String?> loadPdfTemplate() async {
    var path = await ref
        .read(filePickerNotifierProvider.notifier)
        .loadMemberCardTemplate();
    var pathExists = await path.exists();
    if (!pathExists) {
      return null;
    }
    var completePath = '${path.path}\\MitgliedsausweisTemplate.pdf';
    var file = await File(completePath).exists();
    if (!file) {
      return null;
    }
    return completePath;
  }

  Future<void> fillPlaceholderPDF() async {
    // Platzhalter und deren Werte definieren
    final placeholders = ref.read(updateMemberNotifierProvider);

    if (placeholders.memberNumber.isNotEmpty) {
      var docxTemplate = await loadPdfTemplate();
      var pdfPath = File(docxTemplate!).readAsBytesSync();
      final PdfDocument document = PdfDocument(inputBytes: pdfPath);
      PdfTextExtractor extractor = PdfTextExtractor(document);
      final PdfPage page = document.pages[0];

      // Originaltext löschen, indem ein weißes Rechteck über den Text gezeichnet wird
      final PdfGraphics graphics = page.graphics;
      final Rect rect = Rect.fromLTWH(
          0, 0, page.getClientSize().width - 100, page.getClientSize().height - 20);
      graphics.drawRectangle(
        brush: PdfSolidBrush(PdfColor(255, 255, 255)),
        bounds: rect,
      );
      // Textlinien extrahieren und modifizieren
      for (var line in extractor.extractTextLines()) {
        var bounds = line.bounds;
        var fontName = line.fontName;

        line.text = line.text.replaceAll("{{FIRSTNAME}}", placeholders.firstname);
        line.text = line.text.replaceAll("{{LASTNAME}}", placeholders.lastname);
        line.text = line.text.replaceAll("{{NUMBER}}", placeholders.memberNumber);
        var text = line.text;

        if(text == "e"){
          bounds = Rect.fromLTWH(bounds.left + 25, bounds.top , page.getClientSize().width, page.getClientSize().height);
        }

        // Modifizierten Text hinzufügen
        graphics.drawString(
          text,
          PdfStandardFont(getFontFamily(fontName), 6),
          bounds: Rect.fromLTWH(bounds.left, bounds.top -5 , page.getClientSize().width, page.getClientSize().height),
          brush: PdfSolidBrush(PdfColor(117, 117, 117)),
        );
      }

      // Speichern Sie die Datei auf dem Gerät
      final directory = await getTemporaryDirectory();

      String outputPath =
          '${directory.path}/MitgliedsausweisTemplateCopy.pdf';
      final List<int> newBytes = document.saveSync();
      final File newFile = File(outputPath);
      await newFile.writeAsBytes(newBytes);

      // PDF-Dokument schließen
      document.dispose();
      state = outputPath;
      print("PDF ready");
    }
    else {
      print("Keine Placeholder");
    }
  }

  PdfFontFamily getFontFamily(String fontName) {
    for (var family in PdfFontFamily.values) {
      if (family.toString().split('.').last.toLowerCase() ==
          fontName.toLowerCase()) {
        return family;
      }
    }
    // Fallback zu einer Standardschriftart, falls nicht gefunden
    return PdfFontFamily.helvetica;
  }
}
