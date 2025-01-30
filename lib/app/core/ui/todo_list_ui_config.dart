import 'package:flutter/material.dart';


class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
   // textTheme:GoogleFonts.mandaliTextTheme(),
      primaryColor: Color(0Xff5C77CE),
      primaryColorLight: Color(0xffABC8F7),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0Xff5C77CE),
        ),
      ),
      );
}
