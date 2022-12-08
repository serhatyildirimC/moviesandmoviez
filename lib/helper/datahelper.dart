// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextModifier extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool con;

  const TextModifier({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    required this.con,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (con == false) {
      return Text(text,
          style: GoogleFonts.breeSerif(color: color, fontSize: size));
    } else {
      return Text(text,
          maxLines: 11,
          style: GoogleFonts.breeSerif(color: color, fontSize: size));
    }
  }
}
