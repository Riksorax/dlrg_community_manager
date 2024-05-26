import 'package:flutter/material.dart';

import '../../../general/settings/settings.dart';

class GeneralMenu extends StatelessWidget {
  final Function(int) onItemTapped;
  const GeneralMenu({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Allgemeines'),
        ),
        InkWell(
          onTap: () {
            onItemTapped(1);
          },
          child: const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Einstellungen"),
          ),
        ),
      ],
    );
  }
}
