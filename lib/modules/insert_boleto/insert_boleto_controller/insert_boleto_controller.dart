import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slipflow/models/boleto_model.dart';
import 'package:slipflow/shared/auth/auth_controller.dart';
import 'package:slipflow/shared/widgets/notification_widget/notification%20api/notification_api.dart';
import 'package:slipflow/shared/widgets/notification_widget/notification_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InsertBoletoController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime dateSelected = DateTime.now();
  BoletoModel boletoModel = BoletoModel();
  ValueNotifier<bool> statusNotifier = ValueNotifier<bool>(true);
  ValueNotifier<String> dueDateNotifier =
      ValueNotifier<String>('data de validadde');
  ValueNotifier<String?> erroNotifier = ValueNotifier<String?>(null);
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;
  Future<void> registerBoleto(BuildContext context) async {
    final form = formKey.currentState;
    if (dueDateNotifier.value == "data de validadde") {
      erroNotifier.value = "Por favor selecione uma data";
    }
    if (form!.validate() && dueDateNotifier.value != "data de validadde") {
      await saveBoleto();
      if (statusNotifier.value) {
        await addNotification();
      }
      Navigator.pushReplacementNamed(context, '/home', arguments: USER);
    }
  }

  addNotification() async {
    await NotificationApi.showNotification(
        id: 0,
        title: "boleto ${boletoModel.name} venceu !!!",
        body:
            'O seu boleto de ${boletoModel.value} vence ${boletoModel.dueDate}',
        payload: 'boleto.abs');
  }

  Future<void> saveBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList('boletos') ?? <String>[];
      boletos.add(boletoModel.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    } catch (e) {
      print("Algo deu errado, para salvar listas");
      return;
    }
  }

  void onchange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    boletoModel = boletoModel.copyWith(
        name: name, dueDate: dueDate, value: value, barocode: barcode);
  }
}
