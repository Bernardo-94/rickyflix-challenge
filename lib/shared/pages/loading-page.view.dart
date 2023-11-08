import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/loading.gif',
              width: 100,
              height: 100,
            ),
            Text(
              'Login',
              style: GoogleFonts.kanit(
                textStyle: const TextStyle(
                  fontSize: 25,
                  color: Color(0xff38971a),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
