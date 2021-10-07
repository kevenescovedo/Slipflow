import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slipflow/shared/auth/auth_controller.dart';
import 'package:slipflow/shared/theme/animations.dart';

class Loading extends StatelessWidget {
  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    _authController.currentUser(context);

    return Scaffold(
      body: Center(
        child: Lottie.asset(AnimationFiles.animationLoading),
      ),
    );
  }
}
