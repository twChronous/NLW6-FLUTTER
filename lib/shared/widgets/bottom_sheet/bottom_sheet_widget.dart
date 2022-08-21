import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnPressed;
  final VoidCallback secondaryOnPressed;

  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnPressed,
    required this.secondaryOnPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
      quarterTurns: 1,
      child: Material(
        child:Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6)
                    ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                        text: "\n$title", 
                        style: TextStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: "\n$subTitle",
                            style: TextStyles.buttonHeading,
                            )
                        ]),
                        textAlign: TextAlign.center,
                        ),
                    ),
                      Container(
                        height: 1,
                        color: AppColors.stroke
                      ),
                    SetLabelButtons(
                    enablePrimaryColor: true,
                    primaryLabel:primaryLabel,
                    secondaryLabel:secondaryLabel,
                    primaryOnPressed:primaryOnPressed,
                    secondaryOnPressed:secondaryOnPressed
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}