import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onBoard_simple_widget.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Obx((() {
            return Container(
              height: height,
              child: controller.onboardsScreens.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SKIP
                        // SkipButton(onPressed: () {
                        //   controller.onBoardingFinished();
                        // }),
                        // ONBOARD PAGES
                        Expanded(
                          flex: 9,
                          child: PageView.builder(
                            controller: controller.pageController,
                            onPageChanged: (value) {
                              controller.selectedIndex.value = value;
                              controller.selectedIndex.refresh();
                            },
                            itemCount: controller.onboardsScreens.length,
                            itemBuilder: ((context, index) {
                              return OnBoardPage(
                                  onboard: controller.onboardsScreens[index]);
                            }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0 * fem),
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  controller.onboardsScreens.map((element) {
                                bool isSelected =
                                    controller.selectedIndex.value ==
                                        int.parse(element.id);
                                return TabPageSelectorIndicator(
                                    backgroundColor: isSelected
                                        ? ColorPallete.primary
                                        : ColorPallete.grey,
                                    borderColor: isSelected
                                        ? ColorPallete.primary
                                        : ColorPallete.grey,
                                    size: 10);
                              }).toList(),
                            ),
                          ),
                        ),
                        // NEXT BUTTON
                        Expanded(
                          child: RoundedContainer(
                              radius: 0,
                              height: 75,
                              child: controller.selectedIndex.value ==
                                      controller.onboardsScreens.length - 1
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (controller
                                                    .selectedIndex.value ==
                                                controller.onboardsScreens
                                                        .length -
                                                    1) {
                                              controller.onBoardingFinished();
                                            }
                                            // else {
                                            //   controller.pageController.jumpToPage(
                                            //       controller.selectedIndex.value + 1);
                                            // }
                                          },
                                          child: const RoundedContainer(
                                            radius: 15,
                                            color: ColorPallete.primary,
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20.0,
                                                    horizontal: 50),
                                                child: TextView(
                                                  text: "Verify Account",
                                                  color: ColorPallete.theme,
                                                  fontSize: 18,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : null),
                        )
                      ],
                    ),
            );
          })),
        ));
  }
}
