import 'package:Beautech/global/package_export.dart';
import 'package:flutter/material.dart';


final customFont = GoogleFonts.varelaRound(
  fontWeight: FontWeight.w600,
);

Widget textFont(
  String text,
  Color colour, {
  TextOverflow overflow,
  int maxLines,
  double fontSize,
  FontWeight fontWeight,
  TextDecoration deco,
}) {
  return Text(
    text,
    overflow: overflow,
    maxLines: maxLines,
    style: GoogleFonts.varelaRound(
      color: colour,
      fontWeight: fontWeight,
      fontSize: fontSize,
      decoration: deco,
    ),
  );
}
