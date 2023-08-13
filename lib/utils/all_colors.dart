import 'dart:ui';

import 'package:flutter/material.dart';

class AllColors {
  static const Color black = Color(0xFF000000);
  static const Color mediumGray = Color(0xFF4C4747);
  static const Color offGray = Color(0xFFD9D9D9);
  static const Color darkBlue = Color(0xFF405DC6);
  static const Color red = Color(0xFFDA2F82);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green=Color(0xFF008000);
  static const LinearGradient pinkgradient = LinearGradient(
      colors: [Color(0xFFB8227C), Color(0xFFC93061)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const LinearGradient greengradient = LinearGradient(
      colors: [Color(0xFF006400),Color(0xFF2EB62C),],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const Color gray = Color(0xFFD9D9D9);
  static const Color blue = Color(0xFF475993);
  static const Color ash = Color(0xFFC8C8C8);
  static const Color lightAsh = Color(0xFF9B9B9B);
  static const Color darkWhite = Color(0xFFC0C0C0);
}


class Demo{

  void doit(){
    Map<String, dynamic> m= {'name':'taufiq', 'age':24};
    Map<int, int> cors= {
      0:3, 9:3
    };

    List<int> numbers=[2,2,3,32,23,23,23,23];
    Set<int> n={1,1,2,3,4,5,6};
    print(n);
  }
}