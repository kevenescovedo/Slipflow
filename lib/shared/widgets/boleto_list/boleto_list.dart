import 'package:flutter/material.dart';
import 'package:slipflow/models/boleto_model.dart';
import 'package:slipflow/shared/widgets/boleto_list/boleto_list_controller/boleto_list._controller.dart';
import 'package:slipflow/shared/widgets/bolleto_tile/boleto_tile.dart';

class BoletoListWidget extends StatefulWidget {
  BoletoListController controller;
  BoletoListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletoNotifier,
        builder: (_, boletos, __) {
          return Column(
              children: boletos.map((e) => BoletoTileWidget(data: e)).toList());
        });
  }
}
