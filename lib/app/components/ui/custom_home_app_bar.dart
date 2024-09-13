import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color_pallete.dart';
import '../../screens/home/controllers/home_controller.dart';
import 'rounded_container.dart';
import 'text_field.dart';
import 'text_view.dart';

// ignore: must_be_immutable
class CustomHomeAppBar extends GetView<HomeController> {
  String pageName;
  BuildContext drawerContext;
  List<Widget>? actions;
  bool? showActions;
  bool? isNotIntrested;
  String? view;
  final Function()? onCardViewSelected;
  CustomHomeAppBar(
      {super.key,
      required this.pageName,
      this.actions,
      required this.drawerContext,
      this.showActions,
      this.view,
      this.isNotIntrested,
      this.onCardViewSelected});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10 * fem, vertical: 10 * fem),
      width: 360 * fem,
      height: 64 * fem,
      decoration: const BoxDecoration(
        color: ColorPallete.theme,
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0x0c000000),
        //     offset: Offset(0 * fem, 1 * fem),
        //     blurRadius: 5 * fem,
        //   ),
        // ],
      ),
      child: Obx(
        () => Row(
          children: [
            if (!controller.searchedClicked.value)
              RoundedContainer(
                radius: 0,
                child: TextView(
                  text: pageName,
                  weight: FontWeight.w600,
                  color: ColorPallete.secondary,
                  fontSize: 22,
                ),
              ),
            if (!controller.searchedClicked.value) const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     controller.searchedClicked.value =
                  //         !controller.searchedClicked.value;
                  //     controller.searchedClicked.refresh();
                  //   },
                  //   child: Image.asset(
                  //     "assets/ui/search.png",
                  //     width: 25 * fem,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 10 * fem,
                  // ),
                  if (controller.searchedClicked.value)
                    const Expanded(
                      child: MyTextField(
                        hintText: "Search",
                        showLine: true,
                        fontSize: 14,
                      ),
                    ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                ],
              ),
            ),
            // if (showActions ?? false)
            //   Row(
            //       // isRow: true,
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: actions ??
            //           [
            //             InkWell(
            //               onTap: () {
            //                 Get.toNamed(Routes.FILTER);
            //               },
            //               child: RoundedContainer(
            //                 radius: 0,
            //                 child: Image.asset(
            //                   "assets/ui/filter.png",
            //                   width: 25 * fem,
            //                 ),
            //               ),
            //             ),
            //             // SizedBox(
            //             //   width: 15 * fem,
            //             // ),
            //             // Obx(
            //             //   () => Stack(
            //             //     children: [
            //             //       InkWell(
            //             //         onTap: () {
            //             //           Get.find<InterestedController>()
            //             //               .isNotIntrested
            //             //               .value = true;
            //             //           controller.setTabIndex.value = 2;
            //             //         },
            //             //         child: CircleAvatar(
            //             //           radius: 18,
            //             //           backgroundColor: isNotIntrested ?? false
            //             //               ? ColorPallete.primary.withOpacity(0.2)
            //             //               : ColorPallete.theme,
            //             //           child: Padding(
            //             //             padding: EdgeInsets.all(5.0 * fem),
            //             //             child: Image.asset(
            //             //               "assets/ui/dislike.png",
            //             //               width: 22 * fem,
            //             //               color: isNotIntrested ?? false
            //             //                   ? ColorPallete.primary
            //             //                   : ColorPallete.secondary,
            //             //             ),
            //             //           ),
            //             //         ),
            //             //       ),
            //             //       controller.counts["Not Interested"] > 0
            //             //           ? Positioned(
            //             //               right: 0,
            //             //               top: 0,
            //             //               child: CircleAvatar(
            //             //                 backgroundColor: ColorPallete.red,
            //             //                 radius: 7.5 * fem,
            //             //                 child: TextView(
            //             //                   text: controller
            //             //                       .counts["Not Interested"]
            //             //                       .toString(),
            //             //                   fontSize: 10,
            //             //                   color: ColorPallete.theme,
            //             //                 ),
            //             //               ),
            //             //             )
            //             //           : const SizedBox.shrink()
            //             //     ],
            //             //   ),
            //             // ),
            //             if (view == "FEEDS")
            //               SizedBox(
            //                 width: 15 * fem,
            //               ),
            //             if (view == "FEEDS")
            //               Obx(
            //                 () => controller.itemView.value == "CARD"
            //                     ? InkWell(
            //                         onTap: () {
            //                           controller.itemView.value = "LIST";
            //                           controller.itemView.refresh();
            //                         },
            //                         child: const Icon(
            //                           Icons.calendar_view_day_rounded,
            //                           color: ColorPallete.secondary,
            //                         ),
            //                       )
            //                     : InkWell(
            //                         onTap: () {
            //                           controller.itemView.value = "CARD";
            //                           controller.itemView.refresh();
            //                           onCardViewSelected!();
            //                         },
            //                         child: Transform.rotate(
            //                           angle: pi / 2,
            //                           child: const Icon(
            //                             Icons.calendar_view_day_rounded,
            //                             color: ColorPallete.secondary,
            //                           ),
            //                         ),
            //                       ),
            //               )
            //           ])
          ],
        ),
      ),
    );
  }
}
