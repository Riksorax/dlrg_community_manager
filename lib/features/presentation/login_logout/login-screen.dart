import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/providers/auth_service.provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/login_screen";

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authServiceNotifierProvider);
    final authService = ref.watch(authServiceNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false, // Diese Zeile hinzufügen
      ),
      body: Center(
        child: authState.isLoading // Show loading indicator only when authenticating
            ? const CircularProgressIndicator()
            : ElevatedButton(
          onPressed: () async {
            await authService.signInWithGoogle();
          },
          child: const Text('Mit Google anmelden'),
        ),
      ),
    );
  }
}
