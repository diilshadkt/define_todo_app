import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/features/home/view/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routePath = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      backgroundColor: colors.text,
      appBar: AppBar(
        backgroundColor: colors.text,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: Padding(
            padding: EdgeInsets.only(left: spaces.space_250),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/img_profile.jpg"),
            ),
          ),
        ),
        title: Text(
          "Categories",
          style: typography.h600,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spaces.space_250),
        child: Column(
          children: [
            //users review part.
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 30,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 9,
              decoration: BoxDecoration(
                  color: colors.text,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(color: colors.textSubtle, blurRadius: 20.0)
                  ]),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://pics.craiyon.com/2023-11-26/oMNPpACzTtO5OVERUZwh3Q.webp"),
                ),
                title: Text(
                  "\"The memories is a shield and life helper.\"",
                  style: typography.h300,
                ),
                subtitle: Text(
                  "Tamim-Al-Barghouti",
                  style: typography.code,
                ),
              ),
            ),
            //categories grid part.
          ],
        ),
      ),
    );
  }
}
