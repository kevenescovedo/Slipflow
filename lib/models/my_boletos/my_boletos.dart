import 'package:flutter/material.dart';
import 'package:slipflow/models/boleto_model.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:slipflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:slipflow/shared/widgets/boleto_list/boleto_list_controller/boleto_list._controller.dart';
import 'package:animated_card/animated_card.dart';

class MyBoletoPage extends StatefulWidget {
  BoletoListController controller;
  MyBoletoPage({Key? key, required this.controller}) : super(key: key);

  @override
  _MyBoletoPageState createState() => _MyBoletoPageState();
}

class _MyBoletoPageState extends State<MyBoletoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 40,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.colorPrimary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ValueListenableBuilder<List<BoletoModel>>(
                      valueListenable: widget.controller.boletoNotifier,
                      builder: (_, boletos, __) => AnimatedCard(
                            child: BoletoInfoWidget(
                              size: boletos.length,
                            ),
                            direction: AnimatedCardDirection.top,
                          ))),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 24, left: 24),
              child: Row(
                children: [
                  Text(
                    "Meus Boletos",
                    style: AppTextStyles.fontTitleBoldHeading,
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              color: AppColors.colorStroke,
              height: 1,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(
              controller: widget.controller,
            ),
          )
        ],
      ),
    ));
  }
}
