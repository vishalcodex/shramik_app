import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/ui.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  Function()? onPressed;
  RoundedButton(
      {super.key,
      required this.text,
      required this.isFilled,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 21.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: isFilled ? Ui.parseColor("#F56B56") : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Ui.parseColor("#F56B56"),
          )),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 20,
            color: !isFilled ? Ui.parseColor("#F56B56") : Colors.white,
          ),
        ),
      ),
    );
  }
}
