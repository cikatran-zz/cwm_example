import 'package:flutter/material.dart';
import 'CWMColors.dart';
import 'CWMDimens.dart';

class CWMTheme {
  ThemeData getTheme() {
    return ThemeData(
        primaryColor: CWMColors.primary,
        primarySwatch: CWMColors.primary,
        cursorColor: CWMColors.primary,
        hintColor: CWMColors.text_normal,
        buttonColor: CWMColors.primary,
        buttonTheme: buildButtonTheme(),
        inputDecorationTheme: buildInputDecorationTheme(),
        textTheme: buildTextTheme());
  }

  buildButtonTheme() {
    return ButtonThemeData(
      padding: EdgeInsets.all(CWMDimens.textfield_padding),
      textTheme: ButtonTextTheme.primary,
    );
  }

  buildInputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.only(bottom: CWMDimens.textfield_padding),
      hintStyle: TextStyle(
        fontSize: CWMDimens.font_size_medium,
        color: CWMColors.text_normal,
      ),
      labelStyle: TextStyle(
        fontSize: CWMDimens.font_size_medium,
        color: CWMColors.text_normal,
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: CWMColors.text_field_bottom_border_line,
      )),
    );
  }

  buildTextTheme() {
    return TextTheme(
        button: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: CWMDimens.font_size_large,
          color: Colors.white,
        ),
        body1: TextStyle(
          fontSize: CWMDimens.font_size_medium,
          fontWeight: FontWeight.normal,
        ),

        /** TextField **/
        subhead: TextStyle(
            fontSize: CWMDimens.font_size_medium,
            color: CWMColors.text_highlight));
  }

  static const section_header = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: CWMDimens.font_size_header,
  );

  static const block_border = Border(
    top: BorderSide(color: CWMColors.border, width: 0.5),
    bottom: BorderSide(color: CWMColors.border, width: 0.5),
  );
}
