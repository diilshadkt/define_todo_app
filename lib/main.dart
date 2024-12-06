import 'package:define_todo_app/core/theme/theme_provider.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:define_todo_app/features/home/view/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Define Todo App',
      theme: ref.watch(themeProvider),
      home: const HomePage(),
    );
  }
}
