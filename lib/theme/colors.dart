import 'package:flutter/material.dart';

@immutable
class AppColors {
  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
  final mainOrange = const Color.fromRGBO(251, 116, 69, 1.0);
  final secondaryOrange = const Color.fromRGBO(251, 116, 69, 0.8);
  final effectOrange = const Color.fromRGBO(251, 116, 69, 0.2);
  final unselectedButton = const Color.fromRGBO(228, 141, 112, 0.5);
  final selectedButton = const Color.fromRGBO(255, 150, 115, 1.0);
  const AppColors();
}
