import 'dart:ui';

import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/features/auth/controller/auth_controller.dart';
import 'package:define_todo_app/features/home/controller/todo_controller.dart';
import 'package:define_todo_app/features/home/view/pages/settings_page.dart';
import 'package:define_todo_app/features/overview_page/controller/overview_controller.dart';
import 'package:define_todo_app/features/overview_page/view/task_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // final authController = Get.find<AuthController>();

  final TodoController todoController = Get.put(TodoController());
  // final OverviewController _detailController = Get.put(OverviewController());
  final String userId;

  static const routePath = "/home";
  HomePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final todos = todoController.todos;

    todoController.getTodos(userId);

    void showAddTodoDialog() {
      showDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.5),
          builder: (BuildContext context) {
            // final titleController = TextEditingController();
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                content: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Column(
                      children: [
                        // TextField(
                        //   controller: TodoController().titleController,
                        //   decoration: const InputDecoration(
                        //       hintText: 'emoji', border: InputBorder.none),
                        // ),
                        TextField(
                          controller: TodoController().titleController,
                          decoration: const InputDecoration(
                              hintText: 'Title', border: InputBorder.none),
                          onSubmitted: (_) {
                            final title = todoController.titleController.text;
                            final subtitle = todoController.taskController.text;
                            todoController.addTodo(userId, title, subtitle);
                            todoController.titleController.clear();
                            todoController.taskController.clear();
                            Get.back();
                          },
                        ),
                        // TextField(
                        //   controller: TodoController().taskController,
                        //   decoration: const InputDecoration(
                        //       hintText: '0 task', border: InputBorder.none),

                        // ),
                      ],
                    )),
              ),
            );
          });
    }

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
      body: SingleChildScrollView(
        child: Padding(
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
                      BoxShadow(color: colors.textSubtle, blurRadius: 6.0)
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
              SizedBox(
                height: spaces.space_400,
              ),
              //categories grid part.
              Obx(() {
                return Expanded(
                  child: GridView.builder(
                    itemCount: todos.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: spaces.space_200,
                      mainAxisSpacing: spaces.space_200,
                      mainAxisExtent: MediaQuery.sizeOf(context).height / 5.9,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return InkWell(
                          onTap: () {
                            showAddTodoDialog();
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors.text,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: colors.textSubtle,
                                        blurRadius: 4.0)
                                  ]),
                              child: const Icon(Icons.add)),
                        );
                      } else {
                        final todo = todos[index - 1];

                        return InkWell(
                          onTap: () {
                            final todoId = todo.id;
                            Get.to(const TaskOverviewPage(
                                // userId: userId,
                                // todoId: todoId,
                                // taskName: todo.title,
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: colors.text,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: colors.textSubtle, blurRadius: 4.0)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: spaces.space_200,
                                  left: spaces.space_300),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.home),
                                  Text(
                                    "home",
                                    style: typography.h800,
                                  ),
                                  const Text("10 tasks"),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: colors.textInverse,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
