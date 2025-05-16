import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/user_settings/user_settings.notifier.dart';
import '../../../shared/data/models/auth.dart';
import '../../../shared/presentation/widgets/base_scaffold.dart';
import '../../../shared/providers/user_service.provider.dart';
import 'widgets/member_card_template.dart';
import 'widgets/user_settings.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});
  static const routeName = "/settings";

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {

    final auth = ref.watch(userServiceNotifierProvider);

    if (auth.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    else if(auth.value != null){
      return BaseScaffold(
        title: 'Einstellungen',
        body: Container(
            margin: const EdgeInsets.all(24),
            child: auth.value!.role == Role.admin
                ? Column(children: [
              Flexible(fit: FlexFit.loose, child: MemberCardTemplate()),
              Text("Benutzer freischalten. Alle Benutzer"),
              UserSettings()
            ])
                : SizedBox.shrink()),
        onItemTapped: (_) {
          // Logik zur Handhabung von Drawer-Taps
        },
      );
    }
    else{
      return const Center(child: Text("Kein Benutzer gefunden"));
    }
  }
}
