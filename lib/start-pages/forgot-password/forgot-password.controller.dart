import 'package:flutter/widgets.dart';
import 'package:rickyflix_challenge/firebase/authentication/services/auth.service.dart';
import 'package:rickyflix_challenge/shared/styles/show-snackbar-custom.dart';

class ForgotPasswordPageController {
  final emailController = TextEditingController();

  AuthService authService = AuthService();

  String get email => emailController.text;
  set email(String value) => emailController.text = value;

  resetPassword(BuildContext context) {
    authService
        .firebaseResetPassword(
      email: email,
    )
        .then((data) {
      if (data == null) {
        showSnackBar(
            context: context,
            mensagem:
                "Foi enviando um link no seu email para redefinir sua senha",
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
