import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/navigation-bar/nav-bar-custom.view.dart';

class CustomPage extends StatefulWidget {
  final Widget child;
  const CustomPage({super.key, required this.child});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
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
      body: widget.child,
    );
  }
}
