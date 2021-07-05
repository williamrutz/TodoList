import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFFFF9129),
      buttonColor: Color(0xFFFF9129),
      textTheme: GoogleFonts.robotoTextTheme(),
    ),
    home: Home(),
  ));
}
