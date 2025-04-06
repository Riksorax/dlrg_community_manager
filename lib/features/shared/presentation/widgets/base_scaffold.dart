import 'package:flutter/material.dart';

import '../../../presentation/menu/menu_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Function(int) onItemTapped;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(title),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: const Icon(Icons.account_circle),
          ),
        ],
      ),
      drawer: MenuDrawer(onItemTapped: onItemTapped),
      body: body,
    );
  }
}
