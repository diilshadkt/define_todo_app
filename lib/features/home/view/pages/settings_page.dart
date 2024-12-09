import 'package:define_todo_app/core/router/router.dart';
import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:define_todo_app/features/home/view/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
        backgroundColor: colors.text,
        leading: IconButton(
          onPressed: () {
            context.go(HomePage.routePath);
          },
          icon: Icon(Icons.arrow_back_rounded, size: spaces.space_100 * 3.6),
        ),
        title: Text("Settings", style: typography.h600),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 20,
          ),

          // user data part.
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_500),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 30,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width / 12,
                      backgroundImage:
                          const AssetImage("assets/images/img_profile.jpg"),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Malak Idrissi",
                          style: typography.h400,
                        ),
                        Text(
                          "Rabat, Morocco",
                          style: typography.code,
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4.9,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: colors.secondary,
                        radius: MediaQuery.sizeOf(context).width / 16,
                        child: Icon(
                          Icons.edit,
                          color: colors.text,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 30,
                ),
                //user description.
                Text(
                  "Hi! My name is Malak,I'm a community manager from Rabat, Morocco",
                  style: typography.h200.copyWith(color: colors.secondary),
                ),
                SizedBox(
                  height: spaces.space_900,
                ),
                // icons part.
                const ListTileWidget(
                    text: "Notifications", icon: Icons.notifications),
                const ListTileWidget(text: "General", icon: Icons.settings),
                const ListTileWidget(text: "Account", icon: Icons.person),
                const ListTileWidget(text: "About", icon: Icons.info),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
