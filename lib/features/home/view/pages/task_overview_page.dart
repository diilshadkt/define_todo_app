import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';

class TaskOverviewPage extends StatelessWidget {
  const TaskOverviewPage({super.key});

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: Icon(Icons.arrow_back_rounded, size: spaces.space_100 * 3.6),
        ),
        title: Text(
          "Spot",
          style: typography.h600,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 25,
          ),
          Text(
            "Today",
            style: typography.code,
          ),
          // List view part.
          ListView.builder(
            itemBuilder: (context, index) {
              return  ListTile(
                leading: Container(
                  width: MediaQuery.sizeOf(context).width/22,
                  height: MediaQuery.sizeOf(context).height/34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber
                    
                  ),
                   ,

                ),
              );
            },
            itemCount: 5,
          )
        ],
      ),
    );
  }
}


