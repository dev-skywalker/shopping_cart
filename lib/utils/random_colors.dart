import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  static Random random = Random();

  static Color getRandomColor() {
    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);
    double opacity = 1.0;
    return Color.fromRGBO(r, g, b, opacity);
  }
}
