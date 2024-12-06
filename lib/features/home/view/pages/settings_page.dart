import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routePath = "/settings";
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      backgroundColor: colors.text,
      body: Column(
        children: [
          SizedBox(
            height: spaces.space_500 * 1.1,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: spaces.space_200, right: spaces.space_900 * 1.7),
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: spaces.space_100 * 3.6,
                    ),
                    onTap: () {},
                  )),
              Text(
                "Settings",
                style: typography.h600,
              )
            ],
          ),
          // user data part.
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_500),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width / 12,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 25,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Malak Idrissi"), Text("Rabat, Morocco")],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4.9,
                    ),
                    CircleAvatar(
                      backgroundColor: colors.secondary,
                      radius: MediaQuery.sizeOf(context).width / 16,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
