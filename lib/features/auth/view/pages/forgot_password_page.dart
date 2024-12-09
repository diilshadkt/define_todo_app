import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/controller/auth_controller.dart';
import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:define_todo_app/features/auth/view/pages/signup_page.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends HookWidget {
  static const routePath = "/forgot";
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotEmailController = useTextEditingController();
    final forgotFormKey = useMemoized(() => GlobalKey<FormState>());

    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Form(
      key: forgotFormKey,
      child: Scaffold(
        backgroundColor: colors.text,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: spaces.space_500 * 6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: spaces.space_250, right: spaces.space_500),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: spaces.space_100 * 3.6,
                      ),
                      onTap: () {
                        context.go(LoginPage.routePath);
                      },
                    ),
                  ),
                  Text(
                    "Forgot Password",
                    style: typography.h800,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_600),
                child: Column(
                  children: [
                    TextfieldWidget(
                        validator: AuthController().validateEmail,
                        controller: forgotEmailController,
                        hintText: "Email"),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    const Text(
                      "Enter the email address you used to create your account and\nwe will email you a link to reset your password",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    ),

                    SizedBox(
                      height: spaces.space_200 * 2,
                    ),
                    SubmitButtonWidget(
                      onPressed: () async {
                        if (forgotFormKey.currentState!.validate()) {
                          AuthController()
                              .forgotPassword(forgotEmailController.text);
                        }
                      },
                    ),
                    SizedBox(
                      height: spaces.space_400,
                    ),
                    // Already have an account part.
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
