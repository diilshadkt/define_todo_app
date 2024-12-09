import 'package:define_todo_app/core/router/router.dart';
import 'package:define_todo_app/features/auth/view/pages/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  // static const routePath = '/Forgot password';
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text("Forgot Password?",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
      onTap: () {
        context.go(ForgotPasswordPage.routePath);
      },
    );
  }
}
