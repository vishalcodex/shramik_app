import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final Color? color;
  final Gradient? gradient;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? child;
  final Clip? clip;

  final Function()? onPressed;
  const RoundedContainer(
      {super.key,
      this.height,
      this.width,
      required this.radius,
      this.color,
      this.clip,
      this.gradient,
      this.borderColor,
      this.borderWidth,
      this.child,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return InkWell(
      onTap: onPressed,
      child: Container(
        clipBehavior: clip ?? Clip.none,
        height: height != null ? height! * fem : null,
        width: width != null ? width! * fem : width,
        decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(radius * fem),
            border: borderColor != null
                ? Border.all(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 1)
                : null),
        child: child,
      ),
    );
  }
}
