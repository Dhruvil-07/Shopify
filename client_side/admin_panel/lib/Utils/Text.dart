import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStructure extends StatelessWidget {
  TextStructure({Key? key , required this.Msg , required this.size}) : super(key: key);

  String Msg;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      Msg,
      style: GoogleFonts.cairo(
        fontSize : size,
        fontWeight : FontWeight.bold,
      ),
    );
  }
}
