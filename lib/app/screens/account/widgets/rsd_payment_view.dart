import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/account_controller.dart';

class RSDPaymentView extends GetView<AccountController> {
  const RSDPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Column(
      children: [
        Obx(
          () => Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              child: MyListView(
                children: [
                  SizedBox(
                    height: 10 * fem,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isPaymentView.value = false;
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: ColorPallete.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 20 * fem,
                      ),
                      Expanded(
                        child: MyListView(
                          children: [
                            const TextView(
                              text: "Pay Using",
                              color: ColorPallete.secondary,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: 5 * fem,
                            ),
                            const TextView(
                              text:
                                  "Select from our carefully created plans \nand get started ",
                              color: ColorPallete.secondary,
                              weight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15 * fem,
                  ),
                  RoundedContainer(
                    radius: 10,
                    borderColor: ColorPallete.greyDivider,
                    child: Padding(
                      padding: EdgeInsets.all(10.0 * fem),
                      child: MyListView(
                        children: [
                          //Payment Options
                          MyListView(
                            children: controller.paymentOptions.map(
                              (e) {
                                bool isSelected =
                                    e == controller.selectedPaymentOption.value;
                                return InkWell(
                                  onTap: () {
                                    controller.selectedPaymentOption.value = e;
                                  },
                                  child: RoundedContainer(
                                    radius: 0,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10 * fem),
                                          child: Icon(
                                            isSelected
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            size: 20 * fem,
                                            color: ColorPallete.primary,
                                          ),
                                        ),
                                        Expanded(
                                            child: TextView(
                                          text: e,
                                          color: ColorPallete.secondary,
                                          fontSize: 14,
                                        ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 10.0 * fem),
                            child: controller.selectedPaymentOption.value ==
                                    "UPI"
                                ? RoundedContainer(
                                    radius: 5,
                                    color: ColorPallete.greyContainer,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0 * fem),
                                      child: const MyTextField(
                                        fontSize: 14,
                                        initialValue: "",
                                        keyboardType: TextInputType.text,
                                        hintText: "Your UPI ID",
                                        hintColor: ColorPallete.grey,
                                        textColor: ColorPallete.primary,
                                      ),
                                    ),
                                  )
                                : RoundedContainer(
                                    radius: 0,
                                    child: MyListView(
                                      children: [
                                        RoundedContainer(
                                          radius: 5,
                                          color: ColorPallete.greyContainer,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0 * fem),
                                            child: const MyTextField(
                                              fontSize: 14,
                                              initialValue: "",
                                              keyboardType:
                                                  TextInputType.number,
                                              hintText: "Card Number",
                                              hintColor: ColorPallete.grey,
                                              textColor: ColorPallete.primary,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: RoundedContainer(
                                              radius: 5,
                                              color: ColorPallete.greyContainer,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.0 * fem),
                                                child: const MyTextField(
                                                  fontSize: 14,
                                                  initialValue: "",
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText:
                                                      "Expiry (e.g 02/28)",
                                                  hintColor: ColorPallete.grey,
                                                  textColor:
                                                      ColorPallete.primary,
                                                ),
                                              ),
                                            )),
                                            SizedBox(
                                              width: 20 * fem,
                                            ),
                                            Expanded(
                                                child: RoundedContainer(
                                              radius: 5,
                                              color: ColorPallete.greyContainer,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.0 * fem),
                                                child: const MyTextField(
                                                  fontSize: 14,
                                                  initialValue: "",
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText: "CVV",
                                                  hintColor: ColorPallete.grey,
                                                  textColor:
                                                      ColorPallete.primary,
                                                ),
                                              ),
                                            ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 30 * fem,
                          ),
                          // Checkout details
                          RoundedContainer(
                            radius: 10,
                            borderColor: ColorPallete.greyDivider,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: MyListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0 * fem),
                                  child: const TextView(
                                    text: "RSD Summary",
                                    color: ColorPallete.secondary,
                                    fontSize: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: Row(
                                    children: [
                                      TextView(
                                        text: controller.selectedRsd.value,
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                      ),
                                      const Spacer(),
                                      TextView(
                                        text:
                                            "₹ ${controller.getSelectedPlanAmt()}",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: Row(
                                    children: [
                                      const TextView(
                                        text: "GST (10%)",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                      ),
                                      const Spacer(),
                                      TextView(
                                        text:
                                            "₹ ${controller.getSelectedPlanAmt() * 0.1}",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0 * fem),
                                  child: Divider(
                                    height: 5 * fem,
                                    thickness: 1 * fem,
                                    color: ColorPallete.greyDivider,
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: Row(
                                    children: [
                                      const TextView(
                                        text: "Subtotal",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                      ),
                                      const Spacer(),
                                      TextView(
                                        text:
                                            "₹ ${(controller.getSelectedPlanAmt() * 1.1).toStringAsFixed(1)}",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0 * fem),
                                  child: Divider(
                                    height: 5 * fem,
                                    thickness: 1 * fem,
                                    color: ColorPallete.greyDivider,
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: Row(
                                    children: [
                                      const TextView(
                                        text: "Total",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w600,
                                      ),
                                      const Spacer(),
                                      TextView(
                                        text:
                                            "₹ ${(controller.getSelectedPlanAmt() * 1.1).toStringAsFixed(1)}",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15 * fem,
                                ),
                                RoundedContainer(
                                  radius: 0,
                                  color:
                                      ColorPallete.greyDivider.withOpacity(0.5),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.50 * fem),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10 * fem),
                                          child: Icon(
                                            Icons.info_outline,
                                            size: 20 * fem,
                                            color: ColorPallete.secondary,
                                          ),
                                        ),
                                        const Expanded(
                                          child: TextView(
                                            text:
                                                "You have selected a monthly plan | Plan will be valid till 21/02/2024",
                                            color: ColorPallete.grey,
                                            weight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10 * fem,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
          child: InkWell(
            onTap: () {
              controller.payNContinue();
            },
            child: const RoundedContainer(
              radius: 10,
              height: 50,
              color: ColorPallete.primary,
              child: Center(
                  child: TextView(
                text: "Pay & Continue",
                fontSize: 14,
                weight: FontWeight.w500,
                color: ColorPallete.theme,
              )),
            ),
          ),
        ),
        SizedBox(
          height: 10 * fem,
        ),
      ],
    );
  }
}
