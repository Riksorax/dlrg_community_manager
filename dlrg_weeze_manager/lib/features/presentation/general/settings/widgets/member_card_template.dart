import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../providers/docx_template/pdf_template.notifier.dart';
import '../../../../providers/file_picker/file_picker.provider.dart';

class MemberCardTemplate extends ConsumerStatefulWidget {
  const MemberCardTemplate({super.key});

  @override
  ConsumerState<MemberCardTemplate> createState() => _MemberCardTemplateState();
}

class _MemberCardTemplateState extends ConsumerState<MemberCardTemplate> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return FutureBuilder<String?>(
        future: ref.read(pdfTemplateProvider.notifier).loadPdfTemplate(),
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: appTheme.colorScheme.surfaceContainerHighest,
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 24),
            height: deviceSize.height * .47,
            width: deviceSize.width * .35,
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    ref.read(filePickerNotifierProvider.notifier).saveFilePdf();
                    ref.watch(filePickerNotifierProvider);
                  },
                  child: const Text("PDF Ausweis Template wählen"),
                ),
                snapshot.hasData
                    ? Card(
                        margin: const EdgeInsets.only(top: 18),
                        child: SizedBox(
                          height: deviceSize.height * .352,
                          child: SfPdfViewer.file(
                            File(
                              snapshot.data!,
                            ),
                            canShowScrollStatus: false,
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: const Text("Es ist ein Template vorhanden"),
                      ),
              ],
            ),
          );
        });
  }
}
