import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:week15_login/widgets/custom_text_field.dart';
import '../const/colors.dart';
import '../const/text_style.dart';
import '../credentials_store.dart';
import '../widgets/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final CredentialsStore _credentialsStore = CredentialsStore();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: SizedBox(
                height: 200.h,
                width: 250.w,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.h, vertical: 4.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              Shimmer.fromColors(
                                  baseColor: Colors.yellow,
                                  highlightColor: Colors.redAccent,
                                  child: const Text("Sign Up..",
                                      style: titleStyle)),
                              SizedBox(
                                height: 5.h,
                              ),
                              customTextField('full name', nameController,
                                  const Icon(Icons.account_circle),
                                  obscureText: false),
                              SizedBox(
                                height: 3.h,
                              ),
                              customTextField('email', emailController,
                                  const Icon(Icons.email),
                                  obscureText: false),
                              SizedBox(
                                height: 3.h,
                              ),
                              customTextField('password', passwordController,
                                  const Icon(Icons.lock),
                                  obscureText: true),
                              SizedBox(
                                height: 3.h,
                              ),
                              customTextField(
                                  'password',
                                  confirmPasswordController,
                                  const Icon(Icons.lock),
                                  obscureText: true),
                              SizedBox(height: 6.h),
                              AuthButton(
                                text: 'Sign up',
                                onPressed: () async {
                                  final name = nameController.text;
                                  final email = emailController.text;
                                  final password = passwordController.text;
                                  final confirmPassword =
                                      confirmPasswordController.text;

                                  if (name == '' ||
                                      email == '' ||
                                      password == '' ||
                                      confirmPassword == '') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            backgroundColor: Colors.white10,
                                            content: Text(
                                              " ⚠️ Please fill in all fields.",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            )));
                                    return;
                                  }
                                  if (password != confirmPassword) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            backgroundColor: Colors.white10,
                                            content: Text(
                                              "⚠️ Passwords don't match",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            )));
                                    return;
                                  }
                                  final success =
                                      await _credentialsStore.signUp(name,
                                          email, password, confirmPassword);
                                  if (success) {
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            backgroundColor: Colors.white10,
                                            content: Text(
                                              "⚠️ This user is already logged in.",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            )));
                                    return;
                                  }
                                  ;
                                },
                              )
                            ]))))));
  }
}
