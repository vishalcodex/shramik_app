import 'package:flutter/material.dart';

import '../../common/color_pallete.dart';

class TaskIcon extends StatelessWidget {
  final Color? color;
  const TaskIcon({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.
    return Container(
      // height: 35 * fem,
      // width: 35 * fem,
      child: Padding(
        padding: EdgeInsets.all(5.0 * fem),
        child: Icon(Icons.square_rounded, color: color ?? ColorPallete.grey),
      ),
    );
  }
}
