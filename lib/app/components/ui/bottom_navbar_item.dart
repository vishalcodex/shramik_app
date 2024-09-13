import 'package:flutter/material.dart';

import '../../../common/color_pallete.dart';
import 'rounded_container.dart';
import 'text_view.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    this.iconColor = const Color(0xff9dabbe),
    required this.itemName,
    required this.itemIcon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final Color iconColor;
  final String itemName;
  final String itemIcon;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return GestureDetector(
      onTap: onPressed,
      child: RoundedContainer(
        radius: 0,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 5 * fem,
            ),
            Image.asset(
              itemIcon,
              height: 20 * fem,
              width: 20 * fem,
              color: iconColor,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            TextView(
              text: itemName,
              fontSize: 12,
              weight: FontWeight.w500,
              color: iconColor,
            ),
            const Spacer(),
            isSelected
                ? Container(
                    height: 5 * fem,
                    width: 60 * fem,
                    decoration: const BoxDecoration(
                      color: ColorPallete.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(30, 5),
                        topRight: Radius.elliptical(30, 5),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 5 * fem,
                    width: 60 * fem,
                  ),
          ],
        ),
      ),
    );
  }
}
