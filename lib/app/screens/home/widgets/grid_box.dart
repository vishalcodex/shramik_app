import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class GridBox extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final bool? gridView;
  final bool? isSelected;
  const GridBox(
      {super.key,
      required this.color,
      required this.image,
      required this.title,
      this.gridView,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 10,
      borderColor: isSelected ?? false
          ? ColorPallete.primary
          : ColorPallete.grey.withOpacity(0.5),
      clip: Clip.antiAliasWithSaveLayer,
      // gradient: LinearGradient(
      //     begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors),
      child: Padding(
        padding: EdgeInsets.all(1.0 * fem),
        child: gridView ?? true
            ? Stack(
                children: [
                  Positioned(
                    right: -25 * fem,
                    top: -40 * fem,
                    child: CircleAvatar(
                      backgroundColor: color.withOpacity(0.1),
                      radius: 50 * fem,
                    ),
                  ),
                  Positioned(
                    right: 50 * fem,
                    bottom: -15 * fem,
                    child: CircleAvatar(
                      backgroundColor: color.withOpacity(0.1),
                      radius: 15 * fem,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2.5 * fem,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5 * fem, horizontal: 10 * fem),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedContainer(
                              radius: 0,
                              height: 35,
                              child: Image.asset(
                                image,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5 * fem,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: Center(
                            child: TextView(
                              text: title,
                              color: ColorPallete.secondary,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : RoundedContainer(
                radius: 0,
                width: 100,
                child: MyListView(
                  children: [
                    SizedBox(
                      height: 2.5 * fem,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5 * fem, horizontal: 10 * fem),
                      child: Row(
                        children: [
                          RoundedContainer(
                            radius: 0,
                            height: 35,
                            child: Image.asset(
                              image,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                      child: TextView(
                        text: title,
                        color: ColorPallete.secondary,
                        fontSize: 16,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
