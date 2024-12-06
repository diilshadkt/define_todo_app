import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/view/widgets/forgot_password_button_widget.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
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
                  const TextfieldWidget(
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: spaces.space_250,
                  ),
                  const TextfieldWidget(hintText: "Password"),
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
                  const SubmitButtonWidget(),
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
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
