import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:slipflow/modules/insert_boleto/insert_boleto_controller/insert_boleto_controller.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/datepicker/data.picker_widget.dart';
import 'package:slipflow/shared/widgets/input_text/input.text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slipflow/shared/widgets/notification_widget/notification_widget.dart';
import 'package:slipflow/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barocde;
  InsertBoletoPage({Key? key, this.barocde}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final InsertBoletoController controller = InsertBoletoController();
  final moneyInputController = MoneyMaskedTextController(
      leftSymbol: 'R\$', decimalSeparator: ',', initialValue: 0);
  final dueDateinputController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.barocde != null) {
      barcodeInputController.text = widget.barocde!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        //elevação da appbar
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: mediaSize.height,
            width: mediaSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    "Preencha os dados do boleto",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.fontTitleBoldHeading,
                  ),
                ),
                Form(
                    key: controller.formKey,
                    child: Column(children: [
                      InputTextWidget(
                        label: 'Nome do boleto',
                        icon: Icons.description_outlined,
                        validator: controller.validateName,
                        onchanged: (value) {
                          controller.onchange(name: value);
                        },
                      ),
                      ValueListenableBuilder<String?>(
                          valueListenable: controller.erroNotifier,
                          builder: (_, error, __) {
                            return ValueListenableBuilder<String>(
                                valueListenable: controller.dueDateNotifier,
                                builder: (_, dueDate, __) {
                                  return DatePickerWidget(
                                      onCofirm: (date) {
                                        print('change $date in time zone ' +
                                            date.timeZoneOffset.inHours
                                                .toString());
                                        controller.dueDateNotifier.value =
                                            "${date.day}/ ${date.month}/${date.year}";
                                        controller.onchange(
                                            dueDate: controller
                                                .dueDateNotifier.value);
                                      },
                                      erro: error,
                                      text: dueDate,
                                      onChanged: (date) {
                                        print('change $date in time zone ' +
                                            date.timeZoneOffset.inHours
                                                .toString());
                                        controller.dueDateNotifier.value =
                                            "${date.day}/ ${date.month}/${date.year}";
                                        controller.onchange(
                                            dueDate: controller
                                                .dueDateNotifier.value);
                                      });
                                });
                          }),
                      InputTextWidget(
                          label: 'Valor',
                          validator: (_) => controller
                              .validateValor(moneyInputController.numberValue),
                          textEditingController: moneyInputController,
                          icon: FontAwesomeIcons.wallet,
                          onchanged: (value) {
                            controller.onchange(
                                value: moneyInputController.numberValue);
                          }),
                      InputTextWidget(
                          textEditingController: barcodeInputController,
                          label: 'Código do boleto',
                          icon: FontAwesomeIcons.barcode,
                          onchanged: (value) {
                            controller.onchange(
                                barcode: barcodeInputController.text);
                          }),
                      ValueListenableBuilder<bool>(
                          valueListenable: controller.statusNotifier,
                          builder: (_, status, __) {
                            return NotificationWidget(
                                status: status,
                                onToggle: (value) {
                                  controller.statusNotifier.value = value;
                                });
                          })
                    ]))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnpressed: () {
          Navigator.pop(context);
        },
        eneanleSecondaryColor: true,
        secondaryLabel: 'Cadastrar',
        secondaryOnpressed: () async {
          await controller.registerBoleto(context);
          print("aaaaaaaaaaaaa");
        },
      ),
    );
  }
}
