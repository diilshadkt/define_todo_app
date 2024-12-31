import 'package:define_todo_app/core/theme/app_theme.dart';
import 'package:define_todo_app/core/utils/snackbar_utils.dart';
import 'package:define_todo_app/core/widgets/textfield_widget.dart';
import 'package:define_todo_app/features/auth/controller/auth_service.dart';
import 'package:define_todo_app/features/auth/controller/user_service.dart';
import 'package:define_todo_app/features/auth/view/pages/login_page.dart';
import 'package:define_todo_app/features/auth/view/widgets/submit_button_widget.dart';
import 'package:define_todo_app/features/home/view/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignupPage extends HookWidget {
  // static const routePath = '/signup';
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmController = useTextEditingController();

    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    return Form(
      key: formKey,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ));
                      },
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
                    TextfieldWidget(
                      controller: nameController,
                      hintText: "Full Name",
                    ),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    TextfieldWidget(
                        controller: emailController,
                        // validator: AuthController().validateEmail,
                        hintText: "Email"),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    TextfieldWidget(
                        controller: passwordController,
                        // validator: AuthController().validatePassword,
                        hintText: "Password"),
                    SizedBox(
                      height: spaces.space_250,
                    ),
                    TextfieldWidget(
                        controller: confirmController,
                        // validator: (value) => AuthController()
                        //     .validateConfirm(passwordController.text, value),
                        hintText: "Confirm Password"),
                    SizedBox(
                      height: spaces.space_200 * 2,
                    ),
                    SubmitButtonWidget(
                      onPressed: () async {
                        try {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              confirmController.text.isEmpty) {
                            SnackbarUtils.showMessage(
                                "Please fill all the fields");
                          } else {
                            if (passwordController.text !=
                                confirmController.text) {
                              SnackbarUtils.showMessage(
                                  "Password do not match");
                            } else {
                              UserCredential userCredential =
                                  await AuthService().signUp(
                                      emailController.text,
                                      passwordController.text);

                              if (userCredential.user != null) {
                                await UserService().addUser(
                                  nameController.text,
                                  emailController.text,
                                  userCredential.user!.uid,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ));
                                SnackbarUtils.showMessage(
                                    "Account created successfully");
                              } else {
                                SnackbarUtils.showMessage(
                                    "Somethink went wrong");
                              }
                            }
                          }
                        } on FirebaseAuthException catch (e) {
                          SnackbarUtils.showMessage(e.message.toString());
                        }

                        // if (formKey.currentState!.validate()) {
                        //   await AuthController().createAccount(
                        //     emailController.text,
                        //     passwordController.text,
                        //   );
                        // }
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
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
