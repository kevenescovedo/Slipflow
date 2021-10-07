import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:slipflow/models/boleto_model.dart';
import 'package:slipflow/shared/theme/textstyles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: Text(
          "Data de vencimento: ${data.dueDate}",
          style: AppTextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
            text: 'R\$',
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: data.value!.toStringAsFixed(2),
                style: AppTextStyles.trailingBold,
              )
            ])),
      ),
      direction: AnimatedCardDirection.right,
    );
  }
}
