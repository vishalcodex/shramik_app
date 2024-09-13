import 'package:flutter/material.dart';

import '../../common/color_pallete.dart';

class Utils {
  static showModalBotoomSheet(
    BuildContext context,
    Widget child, {
    bool wrap = true,
  }) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    showModalBottomSheet(
      backgroundColor: ColorPallete.theme,
      enableDrag: true,
      showDragHandle: false,
      isScrollControlled: true,
      isDismissible: true,
      anchorPoint: Offset(100, 100),
      useSafeArea: true,
      barrierColor: ColorPallete.themeContrast.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0 * fem),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(
                  //   height: 20 * fem,
                  // ),
                  wrap
                      ? Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.925),
                          // color: Colors.red,
                          child: SingleChildScrollView(child: child))
                      // ListView(
                      //     // mainAxisSize: MainAxisSize.min,
                      //     padding: EdgeInsets.zero,
                      //     // physics: const NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     children: [child],
                      //   )
                      : Expanded(child: child),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
