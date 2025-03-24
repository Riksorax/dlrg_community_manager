import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/user_settings/user_settings.notifier.dart';
import '../../../../shared/data/models/auth.dart';

class UserSettings extends ConsumerStatefulWidget {
  const UserSettings({super.key});

  @override
  ConsumerState<UserSettings> createState() => _AllUserState();
}

class _AllUserState extends ConsumerState<UserSettings> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var userList = ref.watch(userSettingsNotifierProvider).value;
    if (userList == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: userList.length,
      itemBuilder: (context, index) {
        Object status = userList[index].user.status;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: DropdownMenu(
            width: deviceSize.width,
            enabled: status == AuthStatus.pending,
            initialSelection: status,
            dropdownMenuEntries: AuthStatus.values
                .map(
                  (AuthStatus status) => DropdownMenuEntry(
                    value: status,
                    label: status == AuthStatus.pending
                        ? "Ausstehend"
                        : "Bestätigt",
                  ),
                )
                .toList(),
            label: Text(userList[index].user.name),
            onSelected: status == AuthStatus.pending
                ? (value) {
                    AuthStatus temp = value as AuthStatus;
                    userList[index].user.status = temp;
                    ref
                        .read(userSettingsNotifierProvider.notifier)
                        .updateUser(userList[index]);
                  }
                : null,
          ),
        );
      },
    );
  }
}
