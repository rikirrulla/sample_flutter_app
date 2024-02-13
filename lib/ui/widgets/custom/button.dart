import 'package:contact_app/ui/widgets/texts/plus_jakarta_sans.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class ContactButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final double height;
  final double sizeFont;
  final Color textColor;
  final Color buttonColor;
  final Function onPressed;
  final Color disabledColor;

  const ContactButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.sizeFont = 16,
    this.disabled = false,
    this.textColor = AppColors.white,
    this.buttonColor = AppColors.persianGreen,
    this.disabledColor = AppColors.kcMediumGrey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => disabled ? {} : onPressed(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(AppColors.kcMediumGrey),
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.fromLTRB(13, 13, 13, 13),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          disabled ? disabledColor : buttonColor,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: PlusJakartaSans.semiBold(
              text,
              maxLines: 1,
              size: sizeFont,
              color: textColor,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
