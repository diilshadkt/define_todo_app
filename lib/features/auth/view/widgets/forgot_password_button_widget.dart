import 'package:define_todo_app/features/auth/view/pages/forgot_password_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text("Forgot Password?",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgotPasswordPage(),
            ));
      },
    );
  }
}
