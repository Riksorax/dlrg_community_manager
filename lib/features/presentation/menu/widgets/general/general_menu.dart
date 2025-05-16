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
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Einstellungen"),
          onTap: () {
            Navigator.pop(context); // Schließt das Drawer
            Navigator.pushReplacementNamed(
              context,
              Settings.routeName,
            ); // Navigiere zur "Neu Drucken"-Seite
          },
        ),
      ],
    );
  }
}
