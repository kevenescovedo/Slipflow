import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slipflow/shared/auth/auth_controller.dart';
import 'package:slipflow/shared/theme/animations.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/googlesignin/controler_signin.dart';
import 'package:slipflow/shared/widgets/googlesignin/googlesignin.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  AuthController authController = AuthController();
  @override
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: mediaQuery.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: mediaQuery.height * 0.65,
                  child: Stack(
                    children: [
                      Container(
                        width: mediaQuery.width,
                        height: mediaQuery.height * 0.50,
                        decoration: BoxDecoration(
                          color: AppColors.colorPrimary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                      ),
                      kIsWeb
                          ? Align(
                              child: LottieBuilder.asset(
                                  AnimationFiles.animationPrincipal,
                                  height: mediaQuery.height * 0.60),
                              alignment: Alignment.topCenter,
                            )
                          : LottieBuilder.asset(
                              AnimationFiles.animationPrincipal,
                              height: mediaQuery.height * 0.60),
                      Align(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 100,
                        ),
                        alignment: Alignment.bottomCenter,
                      )
                    ],
                  ),
                ),
                Text(
                  "Gerencie os seus boletos e nunca mais esqueça de pagar",
                  style: AppTextStyles.loginText,
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: kIsWeb
                        ? EdgeInsets.symmetric(
                            horizontal: mediaQuery.width * 0.30, vertical: 30)
                        : EdgeInsets.all(20),
                    child: GoogleSigninButton(
                      isLoading: loading,
                      googleclick: () async {
                        setState(() {
                          loading = true;
                        });
                        await GoogleSignin.handleSignIn(context);
                        setState(() {
                          loading = false;
                        });
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
