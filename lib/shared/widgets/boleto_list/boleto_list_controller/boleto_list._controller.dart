import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slipflow/models/boleto_model.dart';

class BoletoListController {
  final boletoNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletoNotifier.value;
  set boletos(List<BoletoModel> value) => boletoNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }
  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('boletos') ?? <String>[];
      boletos = response.map((json) => BoletoModel.fromJson(json)).toList();
    } catch (error) {
      boletos = <BoletoModel>[];
    }
  }
}
