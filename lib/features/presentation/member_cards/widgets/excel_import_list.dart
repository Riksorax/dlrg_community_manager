import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../providers/excel_import/excel_import.notifier.dart';
import '../../../providers/file_picker/file_picker.provider.dart';
import '../../../shared/data/models/auth.dart';
import '../../../shared/providers/user_service.provider.dart';

class ExcelImportList extends ConsumerStatefulWidget {
  const ExcelImportList({super.key});

  @override
  ConsumerState<ExcelImportList> createState() => _ExcelImportListState();
}

class _ExcelImportListState extends ConsumerState<ExcelImportList> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;

    final excelImport = ref.watch(excelImportNotifierProvider);

    final auth = ref.watch(userServiceNotifierProvider);




    Future.delayed(const Duration(seconds: 5), () {
      // deleayed code here
      ref.watch(excelImportNotifierProvider);
    });


    void getFilePathAsync() async {
      var filePath = await ref
          .watch(filePickerNotifierProvider.notifier)
          .getExcelFilePicker();
      if (filePath!.isNotEmpty) {
        ref.watch(excelImportNotifierProvider.notifier).getExcelImport(filePath);
      }
    }

    bool checkRole(){
      if (auth.value != null) {
        var userRole = auth.value?.role;
        if (userRole == Role.admin) {
          getFilePathAsync();
          return true;
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Wende dich bitte an einen Admin fürs Karten erstellen")),
      );
      return false;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: appTheme.colorScheme.surfaceContainerHighest
      ),
      padding: const EdgeInsets.all(12),
      height: deviceSize.height * 0.75,
      width: deviceSize.width * 0.8,
      child: Column(
        children: [
          OutlinedButton(
            onPressed: checkRole,
            child: const Text("Excel Datei wählen"),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: excelImport.length,
              itemBuilder: (context, index) {
                if (excelImport.isEmpty) {
                  return const CircularProgressIndicator();
                }
                var firstName = excelImport[index].firstname.toString();
                var lastName = excelImport[index].lastname.toString();
                var birthDay = DateTime.parse(
                    excelImport[index].birthday.toString());
                var memberNo = excelImport[index].memberNumber.toString();
                var memberCardDone =
                    excelImport[index].memberCardDone;
                return ListTile(
                  leading: Checkbox(
                    value: memberCardDone,
                    onChanged: null,
                  ),
                  title: Text("$firstName $lastName"),
                  subtitle: Text(
                    "${DateFormat("dd.MM.yyyy"
                        "").format(birthDay)}\n$memberNo",
                    maxLines: 2,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
