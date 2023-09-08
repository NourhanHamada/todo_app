import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/view/constant/colors.dart';

ThemeData themeData(context){
  return ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: mainColor,
    textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
  );
}