import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:week15_login/pages/home_page.dart';
import 'package:week15_login/pages/login.dart';
import 'package:week15_login/pages/sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Authentication',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(Colors.white),
            fillColor: MaterialStateProperty.all(Colors.orange),
          )),
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/sign_up': (context) => const SignUpPage(),
            '/home': (context) => const HomePage()
          });
    });
  }
}
