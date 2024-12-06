
import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  static const routePath = '/signup';
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      backgroundColor: colors.text,
      body: Column(
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
                  onTap: (){},
                ),
              ),
              Text(
                "Create an Account",
                style: typography.h800,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_600),
            child: Column(
              children: [
                const TextfieldWidget(hintText: "Full Name"),
                SizedBox(
                  height: spaces.space_250,
                ),
                const TextfieldWidget(hintText: "Email"),
                SizedBox(
                  height: spaces.space_250,
                ),
                const TextfieldWidget(hintText: "Password"),
                SizedBox(
                  height: spaces.space_250,
                ),
                const TextfieldWidget(hintText: "Confirm Password"),
                SizedBox(
                  height: spaces.space_200 * 2,
                ),
                const SubmitButtonWidget(),
                SizedBox(
                  height: spaces.space_400,
                ),
                // Already have an account part.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: typography.code.copyWith(color: colors.secondary),
                    ),
                    SizedBox(
                      width: spaces.space_25,
                    ),
                    InkWell(
                      child: Text(
                        "Log In",
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
    );
  }
}
