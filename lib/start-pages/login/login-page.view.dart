import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickyflix_challenge/shared/validators/validators.dart';
import 'package:rickyflix_challenge/start-pages/login/login-page.controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController controller = LoginPageController();
  final formKey = GlobalKey<FormState>();
  Validators validator = Validators();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.2,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: size.height * 0.58,
                  width: size.width * 0.27,
                  child: Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'RickFlix',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(
                    textStyle: const TextStyle(
                      fontSize: 45,
                      color: Color(0xff38971a),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.14,
            ),
            Form(
              key: formKey,
              child: SizedBox(
                width: size.width * 0.36,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          fontSize: 45,
                          color: Color(0xff38971a),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                      controller: controller.emailController,
                      validator: (value) => validator.emailValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                      controller: controller.passwordController,
                      validator: (value) => validator.requiredValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.loginUser(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          minimumSize: const Size(400, 40),
                          backgroundColor: const Color(0xFF9BD7D3),
                        ),
                        child: const Text('Logar'),
                      )
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Ainda não possui cadastro?'),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Clique Aqui!',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
