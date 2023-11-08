import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/navigation-bar/main-screen.view.dart';
import 'package:rickyflix_challenge/shared/pages/loading-page.view.dart';
import 'package:rickyflix_challenge/start-pages/login/login-page.view.dart';

class PageRouter extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const PageRouter({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const LoginPage();
          }
        }
      },
    );
  }
}
