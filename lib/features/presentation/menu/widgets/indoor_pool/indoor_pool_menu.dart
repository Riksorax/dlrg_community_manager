import 'package:flutter/material.dart';

import '../../../indoor_pool/entrance.dart';
import '../../../indoor_pool/over_view.dart';

class IndoorPoolMenu extends StatelessWidget {
  final Function(int) onItemTapped;

  const IndoorPoolMenu({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Hallenbad'),
        ),
        ListTile(
          leading: const Icon(Icons.door_sliding),
          title: const Text("Einlass"),
          onTap: () {
            Navigator.pop(context); // Schließt das Drawer
            Navigator.pushReplacementNamed(
              context,
              Entrance.routeName,
            );
          },
        ),
        const ListTile(
          leading: Icon(Icons.timer),
          title: Text("Training"),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text("Übersicht"),
          onTap: () {
            Navigator.pop(context); // Schließt das Drawer
            Navigator.pushReplacementNamed(
              context,
              OverView.routeName,
            );
          },
        ),
      ],
    );
  }
}
