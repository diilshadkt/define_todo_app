import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextfieldWidget extends HookWidget {
  final String hintText;
   final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const TextfieldWidget({super.key, required this.hintText,this.isObscure = false,
    this.validator,
    this.controller,});

  @override
  Widget build(BuildContext context) {

    final isObscureState = useState(isObscure);

    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Container(
      height: spaces.space_700,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: colors.textInverse, blurRadius: 6.0),
          ],
          borderRadius: BorderRadius.circular(2)),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isObscureState.value,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: typography.h300.copyWith(color: colors.textInverse),
        ),
      ),
    );
  }
}
