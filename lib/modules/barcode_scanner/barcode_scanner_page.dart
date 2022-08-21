import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: "Não foi possivel identificar um código de barras.", 
      subTitle: "Tente escanear novamente ou digite o código de barras", 
      primaryLabel: "Escanear Novamente", 
      secondaryLabel: "Digitar código", 
      primaryOnPressed: () {}, 
      secondaryOnPressed: () {}
    );
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title:  Text(
                "Escaneie o codigo de barras do boleto",
                style: TextStyles.buttonBackground,
                ),
              leading: const BackButton(
                color: AppColors.background,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
                 Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                 Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.9),
                  ),
                )
            ]),
            bottomNavigationBar: SetLabelButtons(
              primaryLabel: "Inserir Codigo do Boleto", 
              secondaryLabel: "Adicionar da galeria",
              primaryOnPressed: () {},
              secondaryOnPressed: () {},
              ),
          ),
      ),
    );
  }
}