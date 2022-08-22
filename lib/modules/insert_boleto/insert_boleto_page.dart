import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();
  final barcodeInputTextController = TextEditingController();
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final moneyInputTextController = MoneyMaskedTextController(
    initialValue: 0,
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  void pop() {
    Navigator.pop(context);
  }
  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: const BackButton(
          color: AppColors.input,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 93),
            child: Text(
              "Preencha os dados do boleto",
              style: TextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  InputTextWidget(
                    label: "Nome do Boleto",
                    icon: Icons.description_outlined,
                    onChanged: (value) {
                      controller.onChange(name: value);
                    },
                    validator: controller.validateName,
                  ),
                  InputTextWidget(
                    label: "Vencimento",
                    controller: dueDateInputTextController,
                    icon: FontAwesomeIcons.circleXmark,
                    onChanged: (value) {
                      controller.onChange(dueDate: value);
                    },
                    validator: controller.validateVencimento,
                  ),
                  InputTextWidget(
                    label: "Valor",
                    icon: FontAwesomeIcons.wallet,
                    controller: moneyInputTextController,
                    onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                    validator: controller.validateVencimento,
                  ),
                  InputTextWidget(
                    label: "Codigo",
                    icon: FontAwesomeIcons.barcode,
                    controller: barcodeInputTextController,
                    onChanged: (value) {
                      controller.onChange(barcode: value);
                    },
                    validator: controller.validateVencimento,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            primaryLabel: "Cancelar",
            secondaryLabel: "Cadastrar",
            enableSecundaryColor: true,
            primaryOnPressed: () {
              pop();
            },
            secondaryOnPressed: () async {
              await controller.cadastrar();
              pop();
            },
          ),
        ],
      ),
    );
  }
}
