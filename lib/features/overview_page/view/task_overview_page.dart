
import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/features/overview_page/controller/overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskOverviewPage extends StatelessWidget {
  static const routePath = "/overview";
  final OverviewController _overviewController = Get.put(OverviewController());
  final String userId;
  final String todoId;
  TaskOverviewPage({
    super.key,
    required this.userId,
    required this.todoId,
  });

  @override
  Widget build(BuildContext context) {
    _overviewController.fetchDetails(userId, todoId);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
        backgroundColor: colors.text,
        appBar: AppBar(
          backgroundColor: colors.text,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_rounded, size: spaces.space_100 * 3.6),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Spot",
              style: typography.h600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: spaces.space_200),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 25,
              ),

              Padding(
                padding: EdgeInsets.only(right: spaces.space_400 * 9.7),
                child: Text(
                  "Today",
                  style: typography.h200.copyWith(color: colors.textSubtle),
                ),
              ),

              // List view part.
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _overviewController.detail.length,
                    itemBuilder: (context, index) {
                      final detail = _overviewController.detail[index];

                      return ListTile(
                        leading: CircleAvatar(
                          radius: spaces.space_150,
                          backgroundColor:
                              const Color.fromARGB(255, 57, 210, 90),
                          child: CircleAvatar(
                            radius: spaces.space_125,
                            backgroundColor: colors.text,
                          ),
                        ),
                        title: Text(
                          detail.task,
                          style: typography.h300,
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.secondary,
            ),
            constraints: const BoxConstraints.expand(),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(),
                        content: SizedBox(
                          height: 17,
                          child: TextField(
                            controller: _overviewController.taskController,
                            onSubmitted: (_) {
                              final task =
                                  _overviewController.taskController.text;
                              _overviewController.addDetails(
                                  userId, todoId, task);
                              _overviewController.taskController.clear();
                              context.pop();
                            },
                            cursorHeight: 13,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type your task...",
                                hintStyle: typography.h200
                                    .copyWith(color: colors.textSubtle)),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        ));
  }
}
