import 'package:shramik/app/screens/membership/controllers/membership_controller.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/custom_bottom_nav_bar.dart';
import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          key: controller.scaffoldKey,
          // extendBody: true,
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            // leading: InkWell(
            //   onTap: () {
            //     controller.scaffoldKey.currentState!.openDrawer();
            //   },
            //   child: const Icon(
            //     Icons.menu,
            //     color: ColorPallete.primary,
            //   ),
            // ),
            title: Obx(
              () => TextView(
                text: controller.bottomTabs[controller.setTabIndex.value]
                    ["title"],
                color: ColorPallete.theme,
                fontSize: 18,
                weight: FontWeight.bold,
              ),
            ),
            actions: [
              Obx(
                () => controller.setTabIndex.value == 1
                    ? InkWell(
                        onTap: () async {
                          Get.find<MembershipController>()
                              .downloadMembershipCard();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                          child: Icon(
                            Icons.file_download_outlined,
                            color: ColorPallete.theme,
                            size: 25 * fem,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              )
              // InkWell(
              //   onTap: () async {
              //     await Get.find<AuthService>()
              //         .removeCurrentUser()
              //         .then((value) {
              //       // Get.offAndToNamed(Routes.AUTH);
              //       Get.offAllNamed(
              //         Routes.SPLASH,
              //         predicate: (route) => Get.currentRoute == "/splash",
              //       );
              //     });
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 10 * fem),
              //     child: Icon(
              //       Icons.logout_rounded,
              //       color: ColorPallete.theme,
              //       size: 25 * fem,
              //     ),
              //   ),
              // )
            ],
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Obx(
                () => controller.getTabScreen(controller.setTabIndex.value)),
          ),
          bottomNavigationBar: Obx(
            () => MyListView(
              children: [
                if (controller.showMoreOptions.value)
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10 * fem,
                          spreadRadius: 1 * fem,
                          color: ColorPallete.grey.withOpacity(0.5),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          20 * fem,
                        ),
                        topRight: Radius.circular(
                          20 * fem,
                        ),
                      ),
                    ),
                    child: RoundedContainer(
                      radius: 0,
                      color: ColorPallete.theme,
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0 * fem, vertical: 10 * fem),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: controller.moreOptions
                              .map((e) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0 * fem),
                                    child: InkWell(
                                      onTap: () {
                                        // controller.showMoreOptions.value =
                                        //     !controller.showMoreOptions.value;
                                        // controller.onMoreOptionSelected(e);
                                      },
                                      child: RoundedContainer(
                                        radius: 5,
                                        color:
                                            ColorPallete.grey.withOpacity(0.2),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0 * fem,
                                              vertical: 5 * fem),
                                          child: Center(
                                            child: TextView(
                                              text: e,
                                              weight: FontWeight.w400,
                                              color: ColorPallete.secondary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                CustomBottomNavBar(),
              ],
            ),
          ),
          drawer: const CustomDrawer(),
        ),
      ),
    );
  }
}
