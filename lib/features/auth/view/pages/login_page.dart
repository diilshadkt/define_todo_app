import 'dart:developer';

import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/utils/snackbar_utils.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/controller/auth_service.dart';
import 'package:define_todo_app/features/auth/view/pages/signup_page.dart';
import 'package:define_todo_app/features/auth/view/widgets/forgot_password_button_widget.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginPage extends HookWidget {
  // static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

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
                      // validator: AuthController().validateEmail,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    TextfieldWidget(
                        controller: passwordController,
                        // validator: AuthController().validatePassword,
                        hintText: "Password"),
                    SizedBox(
                      height: spaces.space_50,
                    ),
                    const Row(
                      children: [
                        ForgotPasswordButtonWidget(),
                      ],
                    ),
                    SizedBox(
                      height: spaces.space_200 * 2,
                    ),
                    // submit button part.
                    SubmitButtonWidget(
                      onPressed: () async {
                        try {
                          if (emailController.text.isEmpty &&
                              passwordController.text.isEmpty) {
                            SnackbarUtils.showMessage(
                                "Please fill all the fields");
                          } else {
                            await AuthService().login(
                                emailController.text, passwordController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        } on FirebaseAuthException catch (e) {
                          SnackbarUtils.showMessage("Something Went Wrong");
                          log(e.message.toString());
                        }
                        // if (loginFormKey.currentState!.validate()) {
                        //   await AuthController().login(
                        //       emailController.text, passwordController.text);
                        // }
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupPage(),
                                ));
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
