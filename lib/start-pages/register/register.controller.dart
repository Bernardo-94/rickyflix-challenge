import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/firebase/authentication/services/auth.service.dart';
import 'package:rickyflix_challenge/shared/styles/show-snackbar-custom.dart';

class RegisterPageController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  AuthService authService = AuthService();

  String get email => emailController.text;
  set email(String value) => emailController.text = value;

  String get confirmEmail => confirmEmailController.text;
  set confirmEmail(String value) => confirmEmailController.text = value;

  String get password => passwordController.text;
  set password(String value) => passwordController.text = value;

  String get confirmPassword => confirmEmailController.text;
  set confirmPassword(String value) => confirmPasswordController.text = value;

  String get name => nameController.text;
  set name(String value) => nameController.text;

  registerUser(BuildContext context) {
    authService
        .firebaseRegister(
      name: name,
      email: email,
      password: password,
    )
        .then((data) {
      if (data == null) {
        showSnackBar(
            context: context,
            mensagem: "Conta criada com sucesso!",
            isErro: false);
      } else {
        showSnackBar(
          context: context,
          mensagem: data,
        );
      }
    });
  }
}
