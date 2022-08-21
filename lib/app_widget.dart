import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
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
        "/home": (context) => const HomePage(),
        "/splash": (context) => const SplashPage(),
        "/barcode_scanner":(context) => const BarcodeScannerPage(),
      },
    );
  }
}