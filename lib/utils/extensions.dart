import 'package:flutter/material.dart';

extension StringExtensions on String {
  String getPrefix() => this[0];
}

extension NavigationExtension on BuildContext {
  Future navigationNextScreen(Widget nextScreen) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => nextScreen));
}
