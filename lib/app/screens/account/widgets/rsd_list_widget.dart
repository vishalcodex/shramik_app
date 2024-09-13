import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/account_controller.dart';

class RSDListWidget extends GetView<AccountController> {
  const RSDListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
          child: MyListView(
            children: [
              SizedBox(
                height: 10 * fem,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.fromRegister)
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20 * fem,
                        color: ColorPallete.secondary,
                      ),
                    ),
                  SizedBox(
                    width: 15 * fem,
                  ),
                  Expanded(
                    child: MyListView(
                      children: [
                        const TextView(
                          text: "Add RSD",
                          color: ColorPallete.secondary,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        const TextView(
                          text:
                              "RSD is required for buyers to bid on any vehicle",
                          color: ColorPallete.secondary,
                          weight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15 * fem,
        ),
        Obx(
          () => Expanded(
            child: MyListView(
              scroll: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                  child: MyListView(
                    children: controller.rsdList.map((e) {
                      bool isSelected = e["id"] == controller.selectedRsd.value;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0 * fem, horizontal: 10 * fem),
                        child: InkWell(
                          onTap: () {
                            controller.selectedRsd.value = e["id"];
                          },
                          child: RoundedContainer(
                            radius: 20,
                            height: 100,
                            borderColor: isSelected
                                ? ColorPallete.primary
                                : ColorPallete.greyDivider,
                            color: isSelected
                                ? ColorPallete.primary.withOpacity(0.1)
                                : ColorPallete.theme,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10 * fem),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0 * fem),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: e["seller_type"],
                                          color: ColorPallete.secondary,
                                          fontSize: 14,
                                        ),
                                        Icon(
                                          isSelected
                                              ? Icons.check_circle
                                              : Icons.radio_button_off,
                                          size: 25 * fem,
                                          color: isSelected
                                              ? Colors.green
                                              : ColorPallete.greyDivider,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.5 * fem,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: MyListView(
                                          children: [
                                            Center(
                                              child: TextView(
                                                alignment: TextAlign.center,
                                                // ignore: prefer_interpolation_to_compose_strings
                                                text: "₹ " + e["rsd_amt"],
                                                color: ColorPallete.secondary,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5 * fem,
                                            ),
                                            const Center(
                                              child: TextView(
                                                alignment: TextAlign.center,
                                                text: "RSD Amount",
                                                color: ColorPallete.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: MyListView(
                                          children: [
                                            Center(
                                              child: TextView(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                text: "₹ " + e["credit_limit"],
                                                alignment: TextAlign.center,
                                                color: ColorPallete.secondary,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5 * fem,
                                            ),
                                            const Center(
                                              child: TextView(
                                                text: "Credit Limit",
                                                alignment: TextAlign.center,
                                                color: ColorPallete.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Center(
                                              child: TextView(
                                                text: e["vehicle_limit"],
                                                color: ColorPallete.secondary,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5 * fem,
                                            ),
                                            const Center(
                                              child: TextView(
                                                text: "Buying Limit",
                                                color: ColorPallete.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10.0 * fem, vertical: 10 * fem),
          child: RoundedContainer(
            radius: 10,
            borderColor: ColorPallete.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0 * fem, vertical: 10 * fem),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const TextView(
                      text: "Total Amount",
                      fontSize: 14,
                      color: ColorPallete.grey,
                    ),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {},
                      child: TextView(
                        text: "₹ ${controller.getTotalAmount()}",
                        fontSize: 14,
                        color: ColorPallete.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
          child: MyListView(
            children: [
              InkWell(
                onTap: () {
                  controller.continueToPayment();
                },
                child: const RoundedContainer(
                  radius: 10,
                  height: 50,
                  color: ColorPallete.primary,
                  child: Center(
                      child: TextView(
                    text: "Continue to Payment",
                    fontSize: 14,
                    weight: FontWeight.w500,
                    color: ColorPallete.theme,
                  )),
                ),
              ),
              if (controller.fromRegister)
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PREFERENCES,
                        arguments: {"from_register": true});
                  },
                  child: const RoundedContainer(
                    radius: 10,
                    height: 50,
                    // color: ColorPallete.primary,
                    child: Center(
                        child: TextView(
                      text: "Skip for Now",
                      fontSize: 14,
                      weight: FontWeight.w500,
                      color: ColorPallete.primary,
                    )),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 10 * fem,
        ),
      ],
    );
  }
}
