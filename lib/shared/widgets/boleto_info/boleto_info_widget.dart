import 'package:flutter/material.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/images.dart';
import 'package:slipflow/shared/theme/textstyles.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [
          Image.asset(
            AppImages.minibarcode,
            color: Colors.white,
            height: 34,
            width: 56,
          ),
          Container(
            height: 32,
            width: 1,
            color: AppColors.background,
          ),
          Text.rich(TextSpan(
            text: "Você tem ",
            style: AppTextStyles.captionBackground,
            children: [
              TextSpan(
                text: "$size boletos\n",
                style: AppTextStyles.captionBoldBackground,
              ),
              TextSpan(
                text: "cadastrados para pagar",
                style: AppTextStyles.captionBackground,
              ),
            ],
          ))
        ]),
        padding: EdgeInsets.symmetric(vertical: 24),
        ));
  }
}
