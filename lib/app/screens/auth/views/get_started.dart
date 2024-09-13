import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Container(
        color: ColorPallete.theme,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [Color(0xff557FCD), Color(0xff325698)])),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50 * fem,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0 * fem),
                  child: Image.asset(
                    "assets/ui/logo.png",
                    height: 150 * fem,
                  ),
                ),
                SizedBox(
                  height: 40 * fem,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  child: const TextView(
                    text: "Welcome to",
                    alignment: TextAlign.center,
                    color: ColorPallete.secondary,
                    weight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: "Vasai",
                        alignment: TextAlign.center,
                        color: ColorPallete.primary,
                        weight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      TextView(
                        text: " ",
                        alignment: TextAlign.center,
                        color: ColorPallete.primary,
                        weight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      TextView(
                        text: "Pragati",
                        alignment: TextAlign.center,
                        color: ColorPallete.primaryAccent,
                        weight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30 * fem,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  child: const TextView(
                    text: "Your Best Money Transfer Partner.",
                    alignment: TextAlign.center,
                    color: ColorPallete.grey,
                    weight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAndToNamed(Routes.ONBOARDING);
                  },
                  child: RoundedContainer(
                    radius: 10,
                    color: ColorPallete.primary,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0 * fem, vertical: 15 * fem),
                      child: const TextView(
                        text: "Get Started",
                        color: ColorPallete.theme,
                        fontSize: 20,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
