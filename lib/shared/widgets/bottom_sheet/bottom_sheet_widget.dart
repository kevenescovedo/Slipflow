import 'package:flutter/material.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnpressed;
  final VoidCallback secondaryOnpressed;
  final String title;
  final String subtitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnpressed,
    required this.secondaryOnpressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RotatedBox(
      quarterTurns: 1,
      child: Material(
        color: Colors.transparent,
        child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.6))),
                Container(
                  width: double.maxFinite,
                  color: AppColors.shape,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Text.rich(
                          TextSpan(
                              text: title,
                              style: AppTextStyles.fontbuttonBoldHeading,
                              children: [
                                TextSpan(
                                    text: '\n$subtitle',
                                    style: AppTextStyles.fontbuttonHeading)
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 1,
                        color: AppColors.colorStroke,
                      ),
                      SetLabelButtons(
                          enablePrimaryColor: true,
                          primaryLabel: primaryLabel,
                          secondaryLabel: secondaryLabel,
                          primaryOnpressed: primaryOnpressed,
                          secondaryOnpressed: secondaryOnpressed)
                    ],
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
