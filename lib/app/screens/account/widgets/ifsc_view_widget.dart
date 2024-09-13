import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';

class IFSCViewWidget extends StatelessWidget {
  const IFSCViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 10,
      child: Column(
        children: [
          Expanded(
            child: MyListView(
              scroll: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0 * fem),
                  child: MyListView(
                    children: [
                      const TextView(
                        text: "Bank's IFSC",
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      RoundedContainer(
                        radius: 5,
                        color: ColorPallete.greyContainer,
                        child: Padding(
                          padding: EdgeInsets.all(5.0 * fem),
                          child: Row(
                            children: [
                              RoundedContainer(
                                radius: 5,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: const Icon(
                                    Icons.call,
                                    color: ColorPallete.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: MyTextField(
                                    fontSize: 14,
                                    initialValue: "",
                                    keyboardType: TextInputType.number,
                                    hintText: "IFSC Code",
                                    hintColor: ColorPallete.grey,
                                    textColor: ColorPallete.primary,
                                    onChanged: (value) {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10 * fem),
                      const TextView(
                        text: "Branch MICR Code",
                        fontSize: 14,
                      ),
                      SizedBox(height: 10 * fem),
                      RoundedContainer(
                        radius: 5,
                        color: ColorPallete.greyContainer,
                        child: Padding(
                          padding: EdgeInsets.all(5.0 * fem),
                          child: Row(
                            children: [
                              RoundedContainer(
                                radius: 5,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: const Icon(
                                    Icons.call,
                                    color: ColorPallete.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: MyTextField(
                                    fontSize: 14,
                                    initialValue: "",
                                    keyboardType: TextInputType.number,
                                    hintText: "IFSC Code",
                                    hintColor: ColorPallete.grey,
                                    textColor: ColorPallete.primary,
                                    onChanged: (value) {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10 * fem),
                      RoundedContainer(
                        radius: 5,
                        color: ColorPallete.greyContainer,
                        child: Padding(
                          padding: EdgeInsets.all(5.0 * fem),
                          child: Row(
                            children: [
                              RoundedContainer(
                                radius: 5,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: const Icon(
                                    Icons.call,
                                    color: ColorPallete.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: MyTextField(
                                    fontSize: 14,
                                    initialValue: "",
                                    keyboardType: TextInputType.number,
                                    hintText: "Bank Account Number",
                                    hintColor: ColorPallete.grey,
                                    textColor: ColorPallete.primary,
                                    onChanged: (value) {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10 * fem),
                      RoundedContainer(
                        radius: 5,
                        color: ColorPallete.greyContainer,
                        child: Padding(
                          padding: EdgeInsets.all(5.0 * fem),
                          child: Row(
                            children: [
                              RoundedContainer(
                                radius: 5,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: const Icon(
                                    Icons.call,
                                    color: ColorPallete.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: MyTextField(
                                    fontSize: 14,
                                    initialValue: "",
                                    keyboardType: TextInputType.number,
                                    hintText: "Confirm Bank Account Number",
                                    hintColor: ColorPallete.grey,
                                    textColor: ColorPallete.primary,
                                    onChanged: (value) {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20 * fem),
                      RoundedContainer(
                        radius: 10,
                        borderColor: ColorPallete.greyDivider,
                        child: Padding(
                          padding: EdgeInsets.all(15.0 * fem),
                          child: MyListView(
                            children: [
                              TextView(
                                text: "HDFC Bank LTD",
                                fontSize: 16,
                                color: ColorPallete.secondary,
                              ),
                              SizedBox(
                                height: 5 * fem,
                              ),
                              TextView(
                                text:
                                    "No 94 Amarjyothu Layout Bangalore Karnataka",
                                fontSize: 14,
                                color: ColorPallete.secondary,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const RoundedContainer(
                radius: 10,
                height: 50,
                color: ColorPallete.primary,
                child: Center(
                    child: TextView(
                  text: "Save Bank Details",
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
      ),
    );
  }
}
