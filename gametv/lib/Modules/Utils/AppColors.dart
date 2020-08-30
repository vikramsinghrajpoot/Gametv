import 'package:flutter/material.dart';

class AppColors {
  static final lightOrange = Color.fromARGB(1, 208, 136, 32);
  static LinearGradient gradientColor(Color leftColor, Color rightColor) {
    return LinearGradient(
      colors: [leftColor, rightColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
