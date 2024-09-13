import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/account_controller.dart';

// ignore: must_be_immutable
class AccountScreen extends GetView<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
            backgroundColor: ColorPallete.theme,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50 * fem),
              child: CustomAppBar(
                pageName: "Profile",
                onBackPressed: () {
                  Get.back();
                },
                actions: [
                  InkWell(
                    onTap: () {
                      controller.logout();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0 * fem, horizontal: 10 * fem),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout_outlined,
                            color: ColorPallete.grey,
                          ),
                          SizedBox(
                            width: 10 * fem,
                          ),
                          const TextView(
                            text: "Log out",
                            color: ColorPallete.grey,
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: Obx(
              () => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0 * fem, vertical: 5 * fem),
                    child: RoundedContainer(
                      radius: 0,
                      height: 50,
                      child: MyListView(
                        isRow: true,
                        scroll: true,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.tabs.map((e) {
                          bool isSelected = e == controller.selectedTab.value;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0 * fem, horizontal: 5 * fem),
                            child: InkWell(
                              onTap: () {
                                controller.onTabClicked(e);
                              },
                              child: InkWell(
                                onTap: () {
                                  controller.selectedTab.value = e;
                                },
                                child: RoundedContainer(
                                  radius: 10,
                                  color: isSelected
                                      ? ColorPallete.primary
                                      : ColorPallete.theme,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0 * fem,
                                        horizontal: 10 * fem),
                                    child: TextView(
                                      text: e,
                                      fontSize: 16,
                                      color: isSelected
                                          ? ColorPallete.theme
                                          : ColorPallete.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                      child: RoundedContainer(
                    radius: 0,
                    child: controller.getSelectedTabView(),
                  ))
                ],
              ),
            )),
      ),
    );
  }
}
