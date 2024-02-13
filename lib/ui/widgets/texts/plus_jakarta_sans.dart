import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/app_colors.dart';

class PlusJakartaSans extends StatelessWidget {
  final bool italic;
  final Color color;
  final double size;
  final String text;
  final int? maxLines;
  final bool? softWrap;
  final Locale? locale;
  final TextStyle? style;
  final TextAlign textAlign;
  final String? sematicsLabel;
  final FontWeight fontWeight;
  final StrutStyle? strutStyle;
  final TextOverflow? overFlow;
  final double? textScaleFactor;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const PlusJakartaSans(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w400,
        super(key: key);

  const PlusJakartaSans.thin(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w100,
        super(key: key);

  const PlusJakartaSans.semiLight(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w200,
        super(key: key);

  const PlusJakartaSans.light(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  const PlusJakartaSans.medium(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w500,
        super(key: key);

  const PlusJakartaSans.semiBold(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const PlusJakartaSans.bold(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w700,
        super(key: key);

  const PlusJakartaSans.black(
    this.text, {
    Key? key,
    this.style,
    this.locale,
    this.maxLines,
    this.softWrap,
    this.overFlow,
    this.size = 16,
    this.strutStyle,
    this.sematicsLabel,
    this.textDirection,
    this.italic = false,
    this.textWidthBasis,
    this.textScaleFactor,
    this.textHeightBehavior,
    this.color = AppColors.kcDarkGreyColor,
    this.textAlign = TextAlign.start,
  })  : fontWeight = FontWeight.w900,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      locale: locale,
      maxLines: maxLines,
      overflow: overFlow,
      softWrap: softWrap,
      textAlign: textAlign,
      strutStyle: strutStyle,
      textDirection: textDirection,
      semanticsLabel: sematicsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      style: style != null
          ? GoogleFonts.urbanist(
              fontSize: size,
              color: style!.color,
              locale: style!.locale,
              height: style!.height,
              fontWeight: fontWeight,
              shadows: style!.shadows,
              foreground: style!.foreground,
              background: style!.background,
              decoration: style!.decoration,
              wordSpacing: style!.wordSpacing,
              textBaseline: style!.textBaseline,
              fontFeatures: style!.fontFeatures,
              letterSpacing: style!.letterSpacing,
              backgroundColor: style!.backgroundColor,
              decorationColor: style!.decorationColor,
              decorationStyle: style!.decorationStyle,
              decorationThickness: style!.decorationThickness,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            )
          : GoogleFonts.plusJakartaSans(
              color: color,
              fontSize: size,
              fontWeight: fontWeight,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            ),
    );
  }
}
