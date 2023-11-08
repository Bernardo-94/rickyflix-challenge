import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/firebase/authentication/services/auth.service.dart';
import 'package:rickyflix_challenge/shared/styles/show-snackbar-custom.dart';

class LoginPageController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  String get email => emailController.text;
  set email(String value) => emailController.text = value;

  String get password => passwordController.text;
  set password(String value) => passwordController.text = value;

  loginUser(BuildContext context) {
    authService
        .firebaseLogin(
      email: email,
      password: password,
    )
        .then((data) {
      if (data != null) {
        showSnackBar(
          context: context,
          mensagem: data,
        );
      }
    });
  }
}
