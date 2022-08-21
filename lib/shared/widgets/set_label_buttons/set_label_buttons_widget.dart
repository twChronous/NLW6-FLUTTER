import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnPressed;
  final VoidCallback secondaryOnPressed;
  final bool  enablePrimaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnPressed,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56,
        child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel, 
              onPressed: primaryOnPressed,
              style: enablePrimaryColor ? TextStyles.buttonPrimary : null
              )
            ),
          const DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel, 
              onPressed: secondaryOnPressed
            ))
        ]),
      );
  }
}