import 'dart:math';
import 'package:flutter/material.dart';

import '../../../common/color_pallete.dart';
import 'text_view.dart';

class CustomDrawerExpansionTile extends StatefulWidget {
  final List<Widget>? children;
  final Widget? expandTrail;
  final String name;
  const CustomDrawerExpansionTile(
      {super.key,
      required this.children,
      required this.name,
      this.expandTrail});

  @override
  State<CustomDrawerExpansionTile> createState() =>
      _CustomDrawerExpansionTileState();
}

class _CustomDrawerExpansionTileState extends State<CustomDrawerExpansionTile> {
  bool isExpanded = false;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Divider(
          height: 2 * fem,
          color: ColorPallete.greyDivider,
          thickness: 1 * fem,
        ),
        ExpansionTile(
            backgroundColor: ColorPallete.grey.withOpacity(0.2),
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
                angle = value ? pi / 2 : 0;
              });
            },
            trailing: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                if (isExpanded) widget.expandTrail ?? SizedBox.shrink(),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Transform.rotate(
                      angle: angle * value,
                      child: child,
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color:
                        isExpanded ? ColorPallete.primary : ColorPallete.grey,
                    size: 20 * fem,
                  ),
                ),
              ],
            ),
            title: TextView(
              text: widget.name,
              fontSize: 14,
              color: ColorPallete.secondary,
              weight: FontWeight.w600,
            ),
            children: widget.children ?? []),
      ],
    );
  }
}
