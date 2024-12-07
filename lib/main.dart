import 'package:define_todo_app/core/dependencies/dependencies.dart';
import 'package:define_todo_app/core/router/router.dart';
import 'package:define_todo_app/core/theme/theme_provider.dart';
import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:define_todo_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.registerDependencies();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends HookConsumerWidget{
   static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    static final navigatorKey = GlobalKey<NavigatorState>();
  const App({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {

 useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FirebaseAuth.instance.authStateChanges().listen((user) {
          if (user != null && user.emailVerified) {
            App.navigatorKey.currentContext!.go(HomePage.routePath);
          } else {
            App.navigatorKey.currentContext!.go(LoginPage.routePath);
          }
        });
      });

      return null;
    }, []);

    return MaterialApp.router(
       scaffoldMessengerKey: scaffoldMessengerKey,
       routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Define Todo App',
      theme: ref.watch(themeProvider),
      // themeMode: ThemeMode.system,
      // home: const TaskOverviewPage(),
      
    );
  }
}
