import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  // navigatorKey: App.navigatorKey,
  // initialLocation: LandingPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    
    // GoRoute(
    //   path: SignupPage.routePath,
    //   builder: (context, state) => const SignupPage(),
    // ),
    // GoRoute(
    //   path: NavigationPage.routePath,
    //   builder: (context, state) => const NavigationPage(),
    // ),
   
   
  ],
);
