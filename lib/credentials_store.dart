import 'package:shared_preferences/shared_preferences.dart';

class CredentialsStore {
  late SharedPreferences _prefs;

  CredentialsStore() {
    _initPrefs();
  }

  Future rememberMe() async {
    await _prefs.setBool('remember', true);
  }

  bool wasRemembered() {
    return _prefs.getBool('remember') ?? false;
  }

  Future forgetRemembered() async {
    return await _prefs.remove('remember');
  }

  String getCurrentLogin() {
    return _prefs.getString('email') ?? '';
  }

  Future<bool> signUp(String name, String email, String password,
      String confirmPassword) async {
    final savedEmail = _prefs.getString('email');
    if (email == savedEmail) return false;
    await _prefs.setString('email', email);
    await _prefs.setString('password', password);
    return true;
  }

  LoginResult login(String email, String password) {
    final savedEmail = _prefs.getString('email');
    final savedPassword = _prefs.get('password');

    if (savedEmail != email) {
      return LoginResult.wrongEmail;
    }
    if (savedPassword != password) {
      return LoginResult.wrongPassword;
    }
    return LoginResult.success;
  }

  Future _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
}

enum LoginResult {
  wrongEmail('User is not found!'),
  wrongPassword('Invalid password'),
  success('Sign in..');

  final String message;

  const LoginResult(this.message);
}
