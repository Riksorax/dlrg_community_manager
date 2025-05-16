import 'package:flutter/material.dart';

import 'widgets/cards/cards_menu.dart';
import 'widgets/general/general_menu.dart';
import 'widgets/indoor_pool/indoor_pool_menu.dart';

class MenuDrawer extends StatelessWidget {

  final Function(int) onItemTapped;
  const MenuDrawer({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        CardsMenu(onItemTapped: onItemTapped),
        const Divider(),
        IndoorPoolMenu(onItemTapped: onItemTapped),
        const Divider(),
        GeneralMenu(onItemTapped: onItemTapped),
      ],
    );
  }
}
