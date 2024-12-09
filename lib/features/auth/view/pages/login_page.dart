import 'package:define_todo_app/core/router/router.dart';
import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/controller/auth_controller.dart';
import 'package:define_todo_app/features/auth/view/pages/signup_page.dart';
import 'package:define_todo_app/features/auth/view/widgets/forgot_password_button_widget.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends HookWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final forgotEmailController = useTextEditingController();
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );


    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Form(
      key: loginFormKey,
      child: Scaffold(
        backgroundColor: colors.text,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: spaces.space_300 * 5,
              ),
              Center(
                child: Image(
                  image: const AssetImage("assets/images/img_app_logo.png"),
                  height: spaces.space_300 * 6,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_600),
                child: Column(
                  children: [
                    SizedBox(
                      height: spaces.space_150,
                    ),
                    TextfieldWidget(
                      controller: emailController,
                      validator: AuthController().validateEmail,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    TextfieldWidget(
                        controller: passwordController,
                        validator: AuthController().validatePassword,
                        hintText: "Password"),
                    SizedBox(
                      height: spaces.space_50,
                    ),
                    const Row(
                      children: [
                        ForgotPasswordButtonWidget(
                          
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaces.space_200 * 2,
                    ),
                    // submit button part.
                    SubmitButtonWidget(
                      onPressed: () async {

                        if (loginFormKey.currentState!.validate()) {
                          await AuthController().login(
                              emailController.text, passwordController.text);
                        }
                      },
                      
                    ),
                    SizedBox(
                      height: spaces.space_400,
                    ),
                    // don't have an account part.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style:
                              typography.code.copyWith(color: colors.secondary),
                        ),
                        SizedBox(
                          width: spaces.space_25,
                        ),
                        InkWell(
                          child: Text(
                            "Register",
                            style: typography.h200.copyWith(
                                color: colors.secondary,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            context.go(SignupPage.routePath);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
