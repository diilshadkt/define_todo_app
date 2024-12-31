import 'package:define_todo_app/core/theme/dark_theme.dart';
import 'package:define_todo_app/core/theme/light_theme.dart';
import 'package:define_todo_app/features/auth/view/pages/signup_page.dart';
import 'package:define_todo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DependencyInjection.registerDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends HookConsumerWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     FirebaseAuth.instance.authStateChanges().listen((user) {
    //       if (user != null && user.emailVerified) {
    //         App.navigatorKey.currentContext!.go(HomePage.routePath);
    //       } else {
    //         App.navigatorKey.currentContext!.go(LoginPage.routePath);
    //       }
    //     });
    //   });

    //   return null;
    // }, []);

    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Define Todo App',
      darkTheme: ref.watch(darkThemeProvider),
      themeMode: ThemeMode.system,
      theme: ref.watch(lightThemeProvider),
      home: const SignupPage(),
    );
  }
}
