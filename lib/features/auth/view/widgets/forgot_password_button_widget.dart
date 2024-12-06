import 'package:flutter/material.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text("Forgot Password?",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
      onTap: () {},
    );
  }
}
