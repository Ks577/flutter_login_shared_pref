import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:week15_login/const/colors.dart';
import '../credentials_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _login = '';
  final CredentialsStore _credentialsStore = CredentialsStore();

  @override
  void initState() {
    super.initState();
    _getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text('User'),
          actions: [
            TextButton(
              onPressed: () {
                _credentialsStore.forgetRemembered();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/user.png',height: 100,
                width: 150,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Hello, $_login!',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ));
  }

  Future _getLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _login = _credentialsStore.getCurrentLogin();
    });
  }
}
