import 'package:flutter/material.dart';

class AppTheme {
  static final circularBorder = BorderRadius.circular(10);

  static final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ));

  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: circularBorder);

  static InputDecoration inputDecoration(String hint) => InputDecoration(
      border: border,
      focusedBorder: border,
      enabledBorder: border,
      filled: true,
      fillColor: Color(0xFFF2F2F2),
      hintText: hint);
}
