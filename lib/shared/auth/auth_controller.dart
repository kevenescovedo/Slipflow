import 'package:flutter/cupertino.dart';

import 'package:slipflow/models/user_model.dart';
import 'package:slipflow/shared/widgets/googlesignin/controler_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

User? USER = null;

class AuthController {
  var _user;
  set user(User? user) {
    _user = user;
  }

  User get user => _user!;

  setUser(BuildContext context, User? user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home', arguments: user);
      USER = user;

      user = user;
      saverUser(user);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  saverUser(User user) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    print(user.toJson());
    instance.setString('user', user.toJson());
  }

  currentUser(BuildContext context) async {
    Future.delayed(Duration(seconds: 1));
    SharedPreferences instance = await SharedPreferences.getInstance();
    if (instance.containsKey('user')) {
      String? json = instance.getString('user') as String;
      User user = User.fromJson(json);
      setUser(context, user);
    } else {
      setUser(context, null);
    }
  }

  logout(BuildContext context) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await GoogleSignin.googleSignIn.signOut();
    await instance.remove('user');
    setUser(context, null);
  }
}
