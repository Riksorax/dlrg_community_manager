import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_picker.provider.g.dart';

@riverpod
class FilePickerNotifier extends _$FilePickerNotifier {
  @override
  String build() => "";

  Future<String?> getExcelFilePicker() async {
    var picker = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    String? file = "";
    if (picker != null) {
      file = picker.paths[0];
    }
    return file;
  }

  void saveFilePdf() async {
    var outputFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (outputFile != null && outputFile.files.single.path != null) {
      String selectedFilePath = outputFile.files.single.path!;
      File selectedFile = File(selectedFilePath);
      List<int> fileBytes = await selectedFile.readAsBytes();
      var dlrgDirectory = await createTemplateDir();
      String newFilePath = '${dlrgDirectory.path}\\MitgliedsausweisTemplate.pdf';
      File newFile = File(newFilePath);

      if (!dlrgDirectory.existsSync()) {
        dlrgDirectory.createSync();
      }

      await newFile.writeAsBytes(fileBytes);

      state = newFilePath;
    } else {
      print('Keine Datei ausgewählt');
    }
  }

  Future<Directory> createTemplateDir() async {
    var dlrgDirectory = await loadMemberCardTemplate();

    await dlrgDirectory.exists().then(
      (isThere) async {
        if (!isThere) {
          await dlrgDirectory.create(recursive: true);
        }
      },
    );

    return dlrgDirectory;
  }

  Future<Directory> loadMemberCardTemplate() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var dlrgDirectory = Directory('$appDocPath\\DLRG\\AusweisTemplate');
    return dlrgDirectory;
  }
}
