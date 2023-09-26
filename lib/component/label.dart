

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phi/utils/all_colors.dart';

enum Fonts { lobster, roboto, inter ,workSans, popins}

class Label extends StatelessWidget {
  final Fonts? fonts;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextAlign? align;
  final Color? color;
  final TextDecoration? underline;
  final double? letterspacing;
  final FontStyle? fontStyle;

  const Label({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.align,
    this.color,
    this.maxLine,
    this.overflow,
    this.underline,
    this.fonts,
    this.letterspacing, this.fontStyle,


  }) : super(key: key);

  get textStyleBuilder => TextStyle(
      decoration: underline ?? TextDecoration.none,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AllColors.black,
     fontStyle: fontStyle,
      letterSpacing: letterspacing ?? 0.2,


  );

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: textStyleBuilder,
        child: Text(text,
            maxLines: maxLine ?? 50,
            overflow: overflow ?? TextOverflow.visible,
            textAlign: align ?? TextAlign.left,


            style: getTextStyle));
  }

  TextStyle get getTextStyle {
    TextStyle defaultTextStyle = textStyleBuilder;
    switch (fonts) {
      case Fonts.lobster:
        return GoogleFonts.lobster(textStyle: defaultTextStyle);
      case Fonts.workSans:
        return GoogleFonts.workSans(textStyle: defaultTextStyle);
      case Fonts.popins:
        return GoogleFonts.poppins(textStyle: defaultTextStyle);

      case Fonts.inter:
        return GoogleFonts.inter(textStyle: defaultTextStyle);
      case Fonts.roboto:
        return GoogleFonts.roboto(textStyle: defaultTextStyle);
      default:
        return GoogleFonts.workSans(textStyle: defaultTextStyle);
    }
  }
}