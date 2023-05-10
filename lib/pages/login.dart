import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:week15_login/credentials_store.dart';
import 'package:week15_login/widgets/social_buttons.dart';
import '../const/colors.dart';
import '../const/text_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var remember = false;
  final CredentialsStore _credentialsStore = CredentialsStore();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 100.h,
                        width: 150.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // SizedBox(height: 3.h),
                            Shimmer.fromColors(
                                baseColor: Colors.orange,
                                highlightColor: Colors.redAccent,
                                child: const Text(
                                  "Welcome,",
                                  style: titleStyle,
                                )),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Text(
                              "Sign in to Continue!",
                              style: subtitleStyle,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            customTextField(
                                'email',
                                emailController,
                                obscureText: false,
                                const Icon(Icons.email)),
                            SizedBox(
                              height: 3.h,
                            ),
                            customTextField('password', passwordController,
                                const Icon(Icons.lock),
                                obscureText: true),
                            SizedBox(
                              height: 2.h,
                            ),
                            CheckboxListTile(
                              checkColor: Colors.black45,
                              value: remember,
                              onChanged: (b) {
                                setState(() {
                                  remember = b ?? false;
                                });
                              },
                              title: const Text(
                                'Remember me',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                                child: AuthButton(
                              onPressed: () {
                                final email = emailController.text;
                                final password = passwordController.text;
                                final result =
                                    _credentialsStore.login(email, password);
                                switch (result) {
                                  case LoginResult.wrongEmail:
                                  case LoginResult.wrongPassword:
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.white10,
                                            content: Text(
                                              result.message,
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            )));
                                    return;
                                  case LoginResult.success:
                                    /*ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration:
                                                const Duration(seconds: 3),
                                            backgroundColor: Colors.black12,
                                            content: Row(children: <Widget>[
                                              Transform.scale(
                                                  scale: 0.5,
                                                  child:
                                                      const CircularProgressIndicator()),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                result.message,
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              )
                                            ])));*/

                                    if (remember) {
                                      _credentialsStore.rememberMe();
                                    }

                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                }
                              },
                              text: 'Sign in',
                            )),
                            SizedBox(height: 4.h),
                            const Center(
                                child: Text("- Or -",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(height: 4.h),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SocialButton(
                                    onTap: () {},
                                    icon: const Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  SocialButton(
                                    onTap: () {},
                                    icon: const Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  )
                                ]),
                            SizedBox(height: 5.h),
                            Center(
                                child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "I'm new user, ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/sign_up');
                                      },
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Colors.grey,
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    )))));
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 2));
    final remember = _credentialsStore.wasRemembered();
    if (remember) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
