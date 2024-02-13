import 'package:contact_app/ui/widgets/texts/plus_jakarta_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/app_colors.dart';

class ContactTextField extends StatelessWidget {
  final bool edit;
  final bool label;
  final bool phone;
  final Widget? icon;
  final bool enabled;
  final bool readOnly;
  final bool mandatory;
  final Widget? suffix;
  final String overText;
  final bool autofocus;
  final double vertical;
  final String hintText;
  final bool obscureText;
  final double elevation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Color colorHintLabel;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const ContactTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onTap,
    this.suffix,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
    this.edit = false,
    this.textInputType,
    this.label = false,
    this.phone = false,
    this.vertical = 18,
    this.overText = '',
    this.enabled = true,
    this.inputFormatters,
    this.elevation = 0.0,
    this.readOnly = false,
    this.autofocus = false,
    this.mandatory = false,
    this.obscureText = false,
    this.textInputAction = TextInputAction.go,
    this.colorHintLabel = AppColors.kcMediumGrey,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (overText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: PlusJakartaSans(
              overText,
              size: 14,
            ),
          ),
        TextFormField(
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          autofocus: autofocus,
          controller: controller,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          cursorColor: AppColors.ultramarineBlue,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            filled: true,
            prefix: icon,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: phone
                        ? const EdgeInsets.only(left: 7)
                        : const EdgeInsets.all(15.0),
                    child: prefixIcon,
                  )
                : null,
            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: AppColors.kcVeryLightGrey,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: vertical,
            ),
            enabled: enabled,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.ultramarineBlue,
              ),
            ),
            hintStyle: GoogleFonts.manrope(
              fontSize: 16,
              color: AppColors.kcMediumGrey,
              fontWeight: FontWeight.w300,
            ),
          ),
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.kcDarkGreyColor,
            textBaseline: TextBaseline.alphabetic,
          ),
          onChanged: onChanged,
          obscureText: obscureText,
          onFieldSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
