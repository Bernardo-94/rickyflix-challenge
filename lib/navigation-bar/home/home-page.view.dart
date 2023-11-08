import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickyflix_challenge/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                      radius: 200,
                      backgroundImage: AssetImage('assets/images/ram.jpg')),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kanit(
                          textStyle: const TextStyle(
                            fontSize: 45,
                            color: Color(0xff38971a),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Wellcome to RickyFlix!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kanit(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            color: Color(0xff38971a),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Wrap(children: [
                Text(
                  paragraph1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff38971a),
                    ),
                  ),
                ),
              ]),
              Wrap(children: [
                Text(
                  paragraph2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff38971a),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
