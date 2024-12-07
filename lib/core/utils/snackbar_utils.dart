
import 'package:define_todo_app/main.dart';
import 'package:flutter/material.dart';

final class SnackbarUtils {
  static void showMessage(String message) {
    App.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
