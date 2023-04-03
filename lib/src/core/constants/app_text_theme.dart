import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextStyle heading1Style = GoogleFonts.roboto(
      fontWeight: FontWeight.normal,
      fontSize: 36,
      letterSpacing: .4,
      color: Colors.black,
      wordSpacing: 1.5,
      decoration: TextDecoration.none);

  static TextStyle heading2Style =
      heading1Style.copyWith(fontWeight: FontWeight.normal, fontSize: 22);

  static TextStyle extraLightStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w200,
    fontSize: 12,
  );

  static TextStyle lightStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );

  static TextStyle regularStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle regularLargeStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle mediumStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static TextStyle mediumLargeStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle semiBoldStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle boldStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static TextStyle extraBoldStyle = heading1Style.copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 16,
  );
}
