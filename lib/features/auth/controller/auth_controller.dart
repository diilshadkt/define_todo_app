import 'package:define_todo_app/core/utils/snackbar_utils.dart';
import 'package:define_todo_app/features/auth/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final class AuthController {
  late final FirebaseAuthServices authServices;

  AuthController() {
    authServices = GetIt.I.get();
  }

   Future<void> createAccount(String email, String password) async {
    try {
      await authServices.createAccount(email, password);
      await authServices.sendVerificationEmail();

      SnackbarUtils.showMessage("Verification email sent to the email address. Please check your mail.");
    } catch (e) {
      SnackbarUtils.showMessage("Cannot create account. Try again");
    }
  }


  Future<void> login(String email, String password) async {
    try {
      await authServices.login(email, password);

      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        SnackbarUtils.showMessage('Your email is not verified. Please verify email to login.');
      }
    } catch (e) {
      SnackbarUtils.showMessage('Cannot login. Try again');
    }
  }

  Future<void> logout() async {
    try {
      await authServices.logout();
    } catch (e) {
      SnackbarUtils.showMessage('Cannot logout. Try again');
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await authServices.sendPasswordResetEmail(email);

      SnackbarUtils.showMessage('Password reset link is sent to your account');
    } catch (e) {
      SnackbarUtils.showMessage('Cannot reset your password. Try again');
    }
  }

 String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email";
    }

    final emailRegExp =
        RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');
    if (!emailRegExp.hasMatch(value)) {
      return '"Invalid email address"';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must have atleast 8 characters';
    }

    return null;
  }

  String? validateConfirm(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return 'Confirm password is required';
    }

    if (confirm != password) {
      return 'Password do not match';
    }

    return null;
  }

}
