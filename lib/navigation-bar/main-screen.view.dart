import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/navigation-bar/home/home-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/nav-bar-custom.view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RickyFlix'),
        backgroundColor: const Color(0xff74c92a),
      ),
      drawer: const Drawer(
        child: NavBarCustom(),
      ),
      body: const HomePage(),
    );
  }
}
