import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  const TextfieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
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
      child: TextField(
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
