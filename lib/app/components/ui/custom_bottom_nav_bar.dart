import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/color_pallete.dart';
import '../../screens/home/controllers/home_controller.dart';
import 'bottom_navbar_item.dart';

class CustomBottomNavBar extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Container(
        height: 65,
        // height: 60 * fem,
        decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0 * fem, -2 * fem),
              blurRadius: 10 * fem,
              spreadRadius: 1 * fem),
        ]),
        child: Obx(
          () => Container(
            width: 360 * fem,
            color: ColorPallete.theme,
            padding:
                EdgeInsets.symmetric(horizontal: 10 * fem, vertical: 2.5 * fem),
            child: Row(
                children: controller.bottomTabs.map((e) {
              return e["icon"]! == ""
                  ? SizedBox(
                      height: 60 * fem,
                      width: 70 * fem,
                    )
                  : Expanded(
                      child: Center(
                        child: Stack(
                          children: [
                            BottomNavItem(
                              itemIcon: e["icon"]!,
                              itemName: e["title"]!,
                              isSelected: controller.setTabIndex.value ==
                                  int.parse(e["pos"]!),
                              iconColor: (int.parse(e["pos"]!) ==
                                      controller.setTabIndex.value)
                                  ? ColorPallete.primary
                                  : ColorPallete.secondary,
                              onPressed: () {
                                var index = int.parse(e["pos"]!);
                                if (index == 4) {
                                  // Scaffold.of(context).openEndDrawer();
                                  controller.showMoreOptions.value =
                                      !controller.showMoreOptions.value;
                                  controller.showMoreOptions.refresh();
                                } else {
                                  controller.setTabIndex.value = index;
                                  controller.setTabIndex.refresh();
                                }
                              },
                            ),
                            // if (["Feed", "Wishlist", "My Bids"]
                            //     .contains(e["title"]))
                            //   controller.counts[e["title"]] > 0
                            //       ? Positioned(
                            //           right: 0,
                            //           top: 0,
                            //           child: CircleAvatar(
                            //             backgroundColor: ColorPallete.red,
                            //             radius: 7.5 * fem,
                            //             child: TextView(
                            //               text: controller.counts[e["title"]!]
                            //                   .toString(),
                            //               fontSize: 10,
                            //               color: ColorPallete.theme,
                            //             ),
                            //           ),
                            //         )
                            //       : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    );
            }).toList()),
          ),
        ));
  }
}
