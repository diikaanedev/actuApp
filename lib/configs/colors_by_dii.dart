import 'package:flutter/material.dart';

const rouge = Color.fromRGBO(179, 0, 20, 1);
const noir = Color.fromRGBO(0, 0, 0, 1);
const blanc = Color.fromRGBO(255,255, 255, 1);

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}