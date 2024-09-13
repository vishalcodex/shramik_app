import 'package:flutter/material.dart';

class BottomNavPainter extends CustomPainter {
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    // paint.color = Color(0xfff56b56);
    paint.style = PaintingStyle.fill;

    var path = Path();
    var x = size.width;
    var y = size.height;
    var percent = 0.3;
    path.moveTo(0, y * percent);
    path.moveTo(x * 1.9 / 5, y * percent);

    // path.quadraticBezierTo(
    //     x * 1.9 / 5, y * percent, x * 1 / 2, (y * percent) - (x * 1 / 10));

    path.quadraticBezierTo(
        x * 1 / 2, (y * percent) - (x * 1 / 8), x * 3.1 / 5, y * percent);

    path.lineTo(x, y * percent);
    path.lineTo(x, y);
    path.lineTo(0, y);
    path.lineTo(0, y * percent);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
