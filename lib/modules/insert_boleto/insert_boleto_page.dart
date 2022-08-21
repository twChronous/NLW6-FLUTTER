import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InsertBoletoPage extends StatelessWidget {
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      title: Text(
        "Codigo de barras escaneado",
        style: TextStyles.buttonBackground,
       ),
      ),
    );
  }
}