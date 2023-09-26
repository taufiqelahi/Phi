import 'package:flutter/material.dart';
import 'package:phi/utils/extension/extension.dart';

class ShoeUtility {
  final List sizes;
  final List<String>colors;

  ShoeUtility({required this.sizes, required this.colors});
  List<Color> get getColors{
    return colors.map((e) => e.toColor()).toList();
  }


  List get formatedSizes{
  return  sizes.map((e) => e.toDouble()).toList();
  }


}
