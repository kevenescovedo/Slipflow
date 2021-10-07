import 'package:flutter/material.dart';
import 'package:slipflow/models/boleto_model.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:slipflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:slipflow/shared/widgets/boleto_list/boleto_list_controller/boleto_list._controller.dart';

class ExtractPage extends StatefulWidget {
  BoletoListController controller;
  ExtractPage({Key? key, required this.controller}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 24, left: 24),
              child: Row(
                children: [
                  Text(
                    "Meus Extratos",
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
      )),
    );
  }
}
