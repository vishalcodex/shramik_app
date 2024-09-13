import 'package:flutter/material.dart';

import '../../../common/utils.dart';

class TextView extends StatelessWidget {
  final String text;
  final String? font;
  final double? fontSize;
  final Color? color;
  final TextAlign? alignment;
  final FontWeight? weight;
  final int? maxlines;
  final TextOverflow? overflow;
  const TextView(
      {super.key,
      required this.text,
      this.fontSize,
      this.font,
      this.color,
      this.maxlines,
      this.overflow,
      this.alignment,
      this.weight});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Text(
      text,
      textAlign: alignment,
      maxLines: maxlines,
      overflow: overflow,
      style: SafeGoogleFont(font ?? "Open Sans",
          fontSize: (fontSize ?? 12) * ffem,
          fontWeight: weight ?? FontWeight.w500,
          height: 1.2175 * ffem / fem,
          color: color),
    );
  }
}
