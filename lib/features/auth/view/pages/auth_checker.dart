
import 'package:define_todo_app/features/auth/controller/auth_service.dart';
import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerStatefulWidget {
  const AuthChecker({super.key});

  @override
  ConsumerState<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends ConsumerState<AuthChecker> {
  bool isLoggedIn = false;
  @override
  void initState() {
    ref.read(authServiceProvider).auth.currentUser != null
        ? setState(() {
            isLoggedIn = true;
          })
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ?  HomePage() : const LoginPage();
  }
}
