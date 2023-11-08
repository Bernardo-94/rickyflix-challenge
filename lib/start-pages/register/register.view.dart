import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickyflix_challenge/shared/validators/validators.dart';
import 'package:rickyflix_challenge/start-pages/register/register.controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterPageController controller = RegisterPageController();
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
            SizedBox(
              width: size.width * 0.36,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastre-se',
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
                        labelText: 'Nome completo',
                      ),
                      controller: controller.nameController,
                      validator: (value) => validator.requiredValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
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
                        labelText: 'Confirmar e-mail',
                      ),
                      controller: controller.confirmEmailController,
                      validator: (value) => validator.confirmEmailValidator(
                          controller.email, value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      controller: controller.passwordController,
                      validator: (value) => validator.passwordValidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmar senha',
                      ),
                      controller: controller.confirmPasswordController,
                      validator: (value) => validator.confirmPasswordValidator(
                          controller.password, value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.registerUser(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          minimumSize: const Size(300, 40),
                        ),
                        child: const Text('Cadastrar'),
                      )
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já possui cadastro?'),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Logue-se aqui!',
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
