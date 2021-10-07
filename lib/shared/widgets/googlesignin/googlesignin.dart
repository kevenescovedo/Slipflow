import 'package:flutter/material.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/images.dart';
import 'package:slipflow/shared/theme/textstyles.dart';

class GoogleSigninButton extends StatefulWidget {
  VoidCallback googleclick;
  bool isLoading;

  GoogleSigninButton({ this.isLoading = false, required this.googleclick});

  GoogleSigninButtonState createState() => GoogleSigninButtonState();
}

class GoogleSigninButtonState extends State<GoogleSigninButton> {
  bool isLoading = false;
  alterLoadingTrue() {
    print("AAAAAAAAAAAAAAAAAAAAAAA TRUE");
    setState(() {
      isLoading = true;
    });
  }

  alterLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.googleclick,
      child: Container(
        key: widget.key,
        height: 56,
        width: media.width,
        decoration: BoxDecoration(
            color: AppColors.shape,
            border: Border.fromBorderSide(
              
                BorderSide(color: AppColors.colorStroke))),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(AppImages.google),
                  Container(
                    color: AppColors.colorStroke,
                    height: 56,
                    width: 1,
                  )
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: Center(
                  child: widget.isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          "Entrar com google",
                          style: AppTextStyles.loginGooglebutton,
                        )),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
