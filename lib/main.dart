import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/presentation/general/settings/settings.dart';
import 'features/presentation/indoor_pool/entrance.dart';
import 'features/presentation/indoor_pool/over_view.dart';
import 'features/presentation/login_logout/login-screen.dart';
import 'features/presentation/member_cards/member_cards.dart';
import 'features/shared/presentation/theme/theme.dart';
import 'features/shared/presentation/widgets/base_scaffold.dart';
import 'features/shared/providers/auth_service.provider.dart';
import 'firebase_options.dart';

void main() async {
  // Async muss hinzugefügt werden
  WidgetsFlutterBinding
      .ensureInitialized(); // Sicherstellen, dass Widgets initialisiert sind
  await Firebase.initializeApp(
    // Firebase initialisieren
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final authState =
        ref.watch(authServiceNotifierProvider); // Überwache den Auth-Zustand

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DLRG Weeze Manager',
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      themeMode: ThemeMode.light,
      home: Builder( // Wrap with Builder
        builder: (context) { // New context here
          return Scaffold(
            body: Center(
              child: authState.when(
                data: (user) => user != null ? const HomeScreen() : const LoginScreen(),
                error: (error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    print("Login Failed: $error");
                    ScaffoldMessenger.of(context).showSnackBar( // Now this works!
                      SnackBar(content: Text("Login Failed: $error")),
                    );
                  });
                  return const LoginScreen();
                },
                loading: () => const CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login_screen':
            return MaterialPageRoute(builder: (context) => const LoginScreen());
          case '/':
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case '/member_cards':
            return MaterialPageRoute(builder: (context) => const MemberCards());
          case '/entrance':
            return MaterialPageRoute(builder: (context) => const Entrance());
          case '/over_view':
            return MaterialPageRoute(builder: (context) => const OverView());
          case '/settings':
            return MaterialPageRoute(builder: (context) => const Settings());
          default:
            return MaterialPageRoute(builder: (context) => const LoginScreen());
        }
      },
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: 'DLRG Weeze Manager',
        body: const Center(
          child: Text(
              "TODO: \nEine Dashbord erstllen. \nWähle eine Seite aus dem Menü aus."),
        ),
        onItemTapped: _onItemTapped);
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/login_screen');
      case 1:
        Navigator.pushNamed(context, '/member_cards');
      case 2:
        Navigator.pushNamed(context, '/entrance');
      case 3:
        Navigator.pushNamed(context, '/over_view');
      case 4:
        Navigator.pushNamed(context, '/settings');
    }
  }
}
