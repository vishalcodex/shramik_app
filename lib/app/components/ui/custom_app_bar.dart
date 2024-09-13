import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color_pallete.dart';
import 'text_view.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String pageName;
  Widget? leading;
  bool? isCancel;
  Function()? onBackPressed;
  List<Widget>? actions;
  CustomAppBar(
      {super.key,
      required this.pageName,
      this.onBackPressed,
      this.isCancel,
      this.leading,
      this.actions});

  @override
  PreferredSizeWidget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return AppBar(
        titleSpacing: 0,
        toolbarHeight: 50 * fem,
        elevation: 1 * fem,
        backgroundColor: Color(0xffffffff),
        leading: leading ??
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(10.0 * fem),
                child: Image.asset(
                  "assets/ui/back.png",
                  color: ColorPallete.primary,
                ),
              ),
            )
        // IconButton(
        //   icon: Icon(
        //     isCancel ?? false ? Icons.close : Icons.arrow_back_ios,
        //     size: 15 * fem,
        //     color: ColorPallete.hintColor,
        //   ),
        //   onPressed: onBackPressed ??
        //       () {
        //         Get.back();
        //       },
        // ),
        ,
        title: TextView(
          text: pageName,
          fontSize: 18,
          weight: FontWeight.bold,
          color: ColorPallete.secondary,
        ),
        actions: actions ?? []);
  }
}
