import 'package:define_todo_app/core/router/router.dart';
import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/controller/auth_controller.dart';
import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends HookWidget {
  static const routePath = '/signup';
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmController = useTextEditingController();

    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    /// A state that indicate if the signup process is in progress
    final isLoadingState = useState(false);
    return Scaffold(
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
                    onTap: () {},
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
                  const TextfieldWidget(
                    hintText: "Full Name",
                  ),
                  SizedBox(
                    height: spaces.space_250,
                  ),
                  TextfieldWidget(
                      controller: emailController,
                      validator: AuthController().validateEmail,
                      hintText: "Email"),
                  SizedBox(
                    height: spaces.space_250,
                  ),
                  TextfieldWidget(
                      controller: passwordController,
                      validator: AuthController().validatePassword,
                      hintText: "Password"),
                  SizedBox(
                    height: spaces.space_250,
                  ),
                  TextfieldWidget(
                      controller: confirmController,
                      validator: (value) => AuthController()
                          .validateConfirm(passwordController.text, value),
                      hintText: "Confirm Password"),
                  SizedBox(
                    height: spaces.space_200 * 2,
                  ),
                  SubmitButtonWidget(
                    onPressed: () async {
                      isLoadingState.value = true;

                      if (formKey.currentState!.validate()) {
                        await AuthController().createAccount(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                      isLoadingState.value = false;
                    },
                     child: isLoadingState.value
                          ? const Center(
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Text(
                             "CONTINUE",
          style: typography.h200.copyWith(color: colors.text),
),
                  ),
                  SizedBox(
                    height: spaces.space_400,
                  ),
                  // Already have an account part.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style:
                            typography.code.copyWith(color: colors.secondary),
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
                        onTap: () {
                          context.go(LoginPage.routePath);
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
    );
  }
}
