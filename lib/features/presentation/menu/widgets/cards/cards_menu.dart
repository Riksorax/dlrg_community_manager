import 'package:flutter/material.dart';

import '../../../member_cards/member_cards.dart';

class CardsMenu extends StatelessWidget {
  final Function(int) onItemTapped;

  const CardsMenu({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Karten'),
        ),
        ListTile(
          leading: const Icon(Icons.create),
          title: const Text("Erstellen"),
          onTap: () {
            Navigator.pop(context); // Schließt das Drawer
            Navigator.pushReplacementNamed(
              context,
              MemberCards.routeName,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.print),
          title: const Text("Neu Drucken"),
          onTap: () {
            Navigator.pop(context); // Schließt das Drawer
            Navigator.pushNamed(
                context, '/print_card'); // Navigiere zur "Neu Drucken"-Seite
          },
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text("Übersicht"),
          onTap: () {
            Navigator.pop(context); // Schließt das Drawer
            Navigator.pushNamed(
                context, '/card_overview'); // Navigiere zur "Übersicht"-Seite
          },
        ),
      ],
    );
  }
}
