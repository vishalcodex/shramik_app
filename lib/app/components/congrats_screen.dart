import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color_pallete.dart';
import 'ui/text_view.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    var message = Get.arguments["message"];
    var image = Get.arguments["image"];
    var title = Get.arguments["title"];
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0 * fem),
            child: Center(
              child: Image.asset(image ?? "assets/ui/completed.png"),
            ),
          ),
          SizedBox(
            height: 75 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.0 * fem,
            ),
            child: TextView(
              text: title ?? "Congrats!",
              fontSize: 24,
              weight: FontWeight.w700,
              color: ColorPallete.primary,
              alignment: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0 * fem),
            child: TextView(
              alignment: TextAlign.center,
              text: message ?? "",
              fontSize: 18,
              weight: FontWeight.w400,
              color: ColorPallete.grey,
            ),
          ),
        ],
      )),
    );
  }
}
