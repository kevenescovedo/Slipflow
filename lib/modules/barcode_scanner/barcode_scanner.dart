import 'package:flutter/material.dart';
import 'package:slipflow/modules/barcode_scanner/barcode_scanner_controller/barcode_scanner.controller.dart';
import 'package:slipflow/modules/barcode_scanner/barcode_scanner_status/barcode_scanner_status.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:slipflow/shared/widgets/divider_vertical/divider.vertical.dart';
import 'package:slipflow/shared/widgets/label_button/label_button.dart';
import 'package:slipflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarCodeScannerPage extends StatefulWidget {
  BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final BarcodeScannerController barcodeScannerController =
      BarcodeScannerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barcodeScannerController.getAvailableCameras();
    barcodeScannerController.statusNotifier.addListener(() {
      if (barcodeScannerController.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: barcodeScannerController.status.barcode);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    barcodeScannerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  return BottomSheetWidget(
        primaryLabel: 'Escanear novamente',
        secondaryLabel: 'Digitar código',
        primaryOnpressed: () {},
        secondaryOnpressed: () {},
        title: "Não foi possível identificar um código de barras.",
        subtitle: "Tente escanear novamente o boleto."); */
    return SafeArea(
        left: true,
        right: true,
        top: true,
        bottom: true,
        child: Stack(children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: barcodeScannerController.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: barcodeScannerController.cameraController!
                        .buildPreview(),
                  );
                } else {
                  return Container(color: Colors.black);
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  title: Text(
                    "Escaneie o código de barras do boleto",
                    style: AppTextStyles.titleAppbarBarcode,
                  ),
                  leading: BackButton(
                    color: Colors.white,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(color: Colors.transparent),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                    primaryLabel: 'Inserir código do boleto',
                    secondaryLabel: 'Adicionar da galeria',
                    primaryOnpressed: () async {
                      Navigator.pushReplacementNamed(context, '/insert_boleto');
                    },
                    secondaryOnpressed: () {
                      barcodeScannerController.scanWithImagePicker();
                    })),
          ),
          ValueListenableBuilder(
            valueListenable: barcodeScannerController.statusNotifier,
            builder: (BuildContext context, dynamic status, Widget? child) {
              if (status.hasError) {
                return BottomSheetWidget(
                    primaryLabel: 'Escanear novamente',
                    secondaryLabel: 'Digitar código',
                    primaryOnpressed: () {
                      barcodeScannerController.scanWithCamera();
                    },
                    secondaryOnpressed: () {
                      Navigator.pushReplacementNamed(context, '/insert_boleto');
                    },
                    title: "Não foi possível identificar um código de barras.",
                    subtitle: "Tente escanear novamente o boleto.");
              } else {
                return Container();
              }
            },
          ),
        ]));
  }
}
