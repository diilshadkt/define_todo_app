
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  const ButtonWidget({
    super.key,
    required this.text,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF3E60AF),
            fixedSize: Size(50, 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4))),
        onPressed: onpressed,
        child: Text(text));
  }
}
