import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final boldFont = FontWeight.bold;

font(Color? color, double size, FontWeight? weight) => GoogleFonts.sarabun(
      color: color,
      fontSize: size,
      fontWeight: weight,
    );

fontWithSpacing(
        Color? color, double size, FontWeight? weight, double spacing) =>
    GoogleFonts.sarabun(
        color: color,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: spacing);
