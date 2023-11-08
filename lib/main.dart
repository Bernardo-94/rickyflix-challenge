import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/characters-list-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/episodes/episodes-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/main-screen.view.dart';
import 'package:rickyflix_challenge/shared/pages/test-page.view.dart';
import 'package:rickyflix_challenge/start-pages/login/login-page.view.dart';
import 'package:rickyflix_challenge/start-pages/page-router.dart';
import 'package:rickyflix_challenge/start-pages/register/register.view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  //debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RickyFlix',
      theme: ThemeData(
        primaryColor: const Color(0xFF9BD7D3),
      ),
      navigatorKey: navigatorKey,
      home: PageRouter(navigatorKey: navigatorKey),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MainScreen(),
        '/test': (context) => const TestPage(),
        '/characters': (context) => const CharactersListPage(),
        '/episodes': (context) => const EpisodesPage(),
      },
    );
  }
}
