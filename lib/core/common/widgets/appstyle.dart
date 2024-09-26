import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appstyle extends TextStyle {
  const Appstyle(
      {required FontWeight fontWeight,
      required double fontSize,
      required Color textColor})
      : super(fontWeight: fontWeight, color: textColor, fontSize: fontSize);
}
