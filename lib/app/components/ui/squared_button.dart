import 'package:flutter/material.dart';
import '../../../common/color_pallete.dart';
import '../../../common/utils.dart';

// ignore: must_be_immutable
class SquaredButton extends StatelessWidget {
  String text;
  final bool isFilled;
  bool isDisabled;
  final Widget? image;
  final Function()? onPressed;
  Color? color;
  SquaredButton(
      {super.key,
      required this.text,
      required this.isFilled,
      this.image,
      this.onPressed,
      this.color,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    color = color ?? ColorPallete.primary;
    return Container(
      height: 50 * fem,
      decoration: BoxDecoration(
        border: Border.all(color: isDisabled ? color!.withOpacity(0) : color!),
        borderRadius: BorderRadius.circular(12 * fem),
        gradient: LinearGradient(
          begin: const Alignment(-0.876, -1.078),
          end: const Alignment(0.894, 1),
          colors: isDisabled
              ? <Color>[color!.withOpacity(0.5), color!.withOpacity(0.5)]
              : isFilled
                  ? color != null
                      ? <Color>[color!, color!]
                      : <Color>[
                          const Color(0xffff6f59),
                          const Color(0xfff5565e)
                        ]
                  : <Color>[Colors.transparent, Colors.transparent],
          stops: const <double>[0, 1],
        ),
      ),
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image ?? const SizedBox.shrink(),
            text == ""
                ? const SizedBox.shrink()
                : SizedBox(
                    width: 5 * fem,
                  ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Montserrat',
                fontSize: 14 * ffem,
                fontWeight: FontWeight.w700,
                height: 1.1428571429 * ffem / fem,
                color: isFilled ? const Color(0xfff8f9f9) : color!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
