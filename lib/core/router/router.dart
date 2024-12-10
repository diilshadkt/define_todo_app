import 'package:define_todo_app/features/auth/view/pages/forgot_password_page.dart';
import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:define_todo_app/features/auth/view/pages/signup_page.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:define_todo_app/features/home/view/pages/settings_page.dart';
import 'package:define_todo_app/features/overview_page/view/task_overview_page.dart';
import 'package:define_todo_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: App.navigatorKey,
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignupPage.routePath,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: ForgotPasswordPage.routePath,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) =>
          HomePage(userId: FirebaseAuth.instance.currentUser!.uid),
    ),
    GoRoute(
      path: SettingsPage.routePath,
      builder: (context, state) => const SettingsPage(),
    ),
    // GoRoute(
    //   path: TaskOverviewPage.routePath,
    //   builder: (context, state) {
    //     final (String, String) extra = state.extra as (String, String);

    //     return TaskOverviewPage(userId: extra.$1, todoId: extra.$2);
    //   },
    // ),
  ],
);
