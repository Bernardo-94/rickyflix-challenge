import 'package:rickyflix_challenge/firebase/authentication/services/auth.service.dart';

class NavigationBarCustomController {
  AuthService authService = AuthService();

  logoutUser() {
    authService.firebaseResetLogOut();
  }
}
