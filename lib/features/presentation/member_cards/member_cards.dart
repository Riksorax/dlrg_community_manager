import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/presentation/widgets/base_scaffold.dart';
import 'widgets/create_card.dart';
import 'widgets/excel_import_list.dart';

class MemberCards extends ConsumerStatefulWidget {
  const MemberCards({super.key});
  static const routeName = "/member_cards";

  @override
  ConsumerState<MemberCards> createState() => _MemberCardsState();
}

class _MemberCardsState extends ConsumerState<MemberCards> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return BaseScaffold(
      title: 'Mitgliederkarten',
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              fit: FlexFit.loose,
              child: ExcelImportList(),
            ),
            SizedBox(
              height: 50,
              width: deviceSize.width * 0.2,
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: CreateCard(),
            ),
          ],
        ),
      ),
      onItemTapped: (_) {
        // Logik zur Handhabung von Drawer-Taps
      },
    );
  }
}
