import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../providers/nfc/nfc_write.notifier.dart';
import '../../../providers/pdf_template/pdf_template.notifier.dart';
import '../../../providers/update_member/update_member.notifier.dart';

class CreateCard extends ConsumerStatefulWidget {
  const CreateCard({super.key});

  @override
  ConsumerState<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends ConsumerState<CreateCard> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final pdfPath = ref.watch(pdfTemplateProvider);
    final nfcWriteState = ref.watch(nfcWriteNotifierProvider).value;
    ref.watch(updateMemberNotifierProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Column(
            children: [
              Container(
                height: deviceSize.height * .262,
                width: deviceSize.width * .8,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: pdfPath.isNotEmpty
                    ? SfPdfViewer.file(File(pdfPath))
                    : const Placeholder(),
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: null,
                    label: const Text("Drucken"),
                    icon: const Icon(Icons.print),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      ref
                          .read(nfcWriteNotifierProvider.notifier)
                          .writeNfcCardAsync();
                      String message = nfcWriteState!
                          ? 'Erfolgreich beschrieben!'
                          : 'Bitte eine neue Karte auflegen';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    },
                    label: const Text("NFC"),
                    icon: const Icon(Icons.nfc),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      ref
                          .watch(updateMemberNotifierProvider.notifier)
                          .updateMemberCardDone();
                    },
                    label: const Text("Nächster"),
                    icon: const Icon(Icons.navigate_next),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
