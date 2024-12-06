import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;
  const ListTileWidget({
    super.key,
    required this.text,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    return ListTile(
      onTap: ontap,
      leading: Icon(
        icon,
      ),
      title: Text(text, style: typography.h400),
    );
  }
}
