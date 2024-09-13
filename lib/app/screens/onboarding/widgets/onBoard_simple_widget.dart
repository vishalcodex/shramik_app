// ignore: file_names
import 'package:flutter/material.dart';

import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/onBoard_model.dart';

// ignore: must_be_immutable
class OnBoardPage extends StatelessWidget {
  OnBoard onboard;
  OnBoardPage({
    super.key,
    required this.onboard,
  });

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    PageController(initialPage: 0, keepPage: false);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // SizedBox(height: 50.h),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
            child: RoundedContainer(
              radius: 0,
              child: Image.asset(onboard.image!),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextView(
                alignment: TextAlign.center,
                text: onboard.title ?? "Title",
                fontSize: 30 * fem,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 25 * fem,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0 * fem,
                ),
                child: TextView(
                  alignment: TextAlign.center,
                  text: onboard.description ?? "Description",
                  fontSize: 16 * fem,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
