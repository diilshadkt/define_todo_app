import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const SubmitButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: spaces.space_700,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(4))),
        onPressed: onPressed,
        child: Text(
          "CONTINUE",
          style: typography.h200.copyWith(color: colors.text),
        ),
      ),
    );
  }
}
