import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/shared/models/user_module.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';

import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor:  AppColors.primary
      ),
      initialRoute: "/splash",
      routes: {
        "/login": (context) => const LoginPage(),
        "/splash": (context) => const SplashPage(),
        "/barcode_scanner":(context) => const BarcodeScannerPage(),
        "/home": (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel),
         "/insert_boleto": (context) => InsertBoletoPage(
            barcode: ModalRoute.of(context) != null
                ? ModalRoute.of(context)!.settings.arguments.toString()
                : null)
      },
    );
  }
}