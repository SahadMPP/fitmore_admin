import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  static TextStyle headline1 = GoogleFonts.poppins(
    fontSize: 24.sp,         // Large headline
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 20.sp,         // Medium headline
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static TextStyle headline3 = GoogleFonts.poppins(
    fontSize: 18.sp,         // Small headline
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static TextStyle bodyText1 = GoogleFonts.lato(
    fontSize: 14.sp,         // Regular body text
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static TextStyle bodyText2 = GoogleFonts.lato(
    fontSize: 12.sp,         // Smaller body text
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static TextStyle caption = GoogleFonts.lato(
    fontSize: 10.sp,         // Caption or small text
    fontWeight: FontWeight.w400,
    color: Colors.grey[600],
  );

  static TextStyle button = GoogleFonts.roboto(
    fontSize: 14.sp,         // Button text
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
