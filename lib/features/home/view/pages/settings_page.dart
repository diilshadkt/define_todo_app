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
                SizedBox(
                  height: spaces.space_300,
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
                  height: spaces.space_300,
                ),
                //user description.
                Text(
                  "Hi! My name is Malak,I'm a community manager from Rabat, Morocco",
                  style: typography.h200.copyWith(color: colors.secondary),
                ),
                SizedBox(
                  height: spaces.space_900,
                ),
                // icons notification.
                InkWell(
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.notifications),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 15,
                        ),
                        Text(
                          "Notification",
                          style: typography.h300,
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10 / 4,
                ),
                // icons General.
                InkWell(
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 15,
                        ),
                        Text(
                          "General",
                          style: typography.h300,
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10 / 4,
                ),
                // icons Account.
                InkWell(
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 15,
                        ),
                        Text(
                          "Account",
                          style: typography.h300,
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10 / 4,
                ),
                // icons About.
                InkWell(
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 15,
                        ),
                        Text(
                          "About",
                          style: typography.h300,
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10 / 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
