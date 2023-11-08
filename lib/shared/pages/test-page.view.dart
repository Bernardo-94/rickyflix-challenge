import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/navigation-bar/custom.page.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomPage(
      child: SizedBox(
        width: size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 90.0,
            width: 75.0,
            child: Image.asset(
              'assets/images/login.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
