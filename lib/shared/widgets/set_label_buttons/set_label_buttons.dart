import 'package:flutter/material.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/divider_vertical/divider.vertical.dart';
import 'package:slipflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnpressed;
  final VoidCallback secondaryOnpressed;
  final bool enablePrimaryColor;
  final bool eneanleSecondaryColor;

  const SetLabelButtons({
    Key? key,
    this.enablePrimaryColor = false,
    this.eneanleSecondaryColor = false,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnpressed,
    required this.secondaryOnpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.shape,
        height: 57,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.colorStroke,
            ),
            Container(
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 56,
                      child: LabelButton(
                        label: primaryLabel,
                        style: enablePrimaryColor
                            ? AppTextStyles.fontbuttonPrimary
                            : null,
                        onPressed: primaryOnpressed,
                      ),
                    )),
                    DividerVertical(),
                    Expanded(
                        child: Container(
                      child: LabelButton(
                        label: secondaryLabel,
                        onPressed: secondaryOnpressed,
                        style: eneanleSecondaryColor
                            ? AppTextStyles.fontbuttonPrimary
                            : null,
                      ),
                      height: 56,
                    ))
                  ],
                )),
          ],
        ));
  }
}
