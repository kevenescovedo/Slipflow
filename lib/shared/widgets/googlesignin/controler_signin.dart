import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:slipflow/models/user_model.dart';
import 'package:slipflow/shared/auth/auth_controller.dart';
import 'package:slipflow/shared/widgets/googlesignin/googlesignin.dart';

class GoogleSignin {
  static String clientId =
      "945130276969-9959matu4qtlk50cp113f5spvnokfsas.apps.googleusercontent.com";
  static GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: clientId,
    scopes: [
      'email',
    ],
  );

  static Future<void> handleSignIn(BuildContext context) async {
    AuthController _authController = AuthController();
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      User user = User(
          displayNome: googleSignInAccount!.displayName,
          email: googleSignInAccount.email,
          photoUrl: googleSignInAccount.photoUrl);

      print(user);
      _authController.setUser(context, user);
    } catch (error) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Erro ao Logar',
        desc: 'Por favor tente novamente mais tarde',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
      print(error);
      _authController.setUser(context, null);
    }
  }
}
