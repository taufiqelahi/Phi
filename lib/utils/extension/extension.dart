import 'package:flutter/material.dart';
import 'package:phi/utils/all_colors.dart';

extension ColorExtension on String {
 Color toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    else{
      return AllColors.black;
    }
  }
}