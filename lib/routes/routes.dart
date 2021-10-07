import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slipflow/models/user_model.dart';
import 'package:slipflow/modules/barcode_scanner/barcode_scanner.dart';
import 'package:slipflow/modules/home/home.dart';
import 'package:slipflow/modules/insert_boleto/insert._boleto.dart';
import 'package:slipflow/modules/loading/loading.dart';
import 'package:slipflow/modules/login/login.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Loading());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/barcodescanner':
        return MaterialPageRoute(builder: (_) => BarCodeScannerPage());
      case '/insert_boleto':
        return MaterialPageRoute(
            builder: (_) => InsertBoletoPage(
                  barocde: arguments != null ? arguments as String : null,
                ));
      case '/home':
        return MaterialPageRoute(
            builder: (_) => Home(
                  usermodel: arguments as User,
                ));
      default:
        return MaterialPageRoute(builder: (_) => Login());
    }
  }
}
