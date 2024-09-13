import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';

class UPIViewWidget extends StatelessWidget {
  const UPIViewWidget({super.key});

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
                        text: "Your UPI ID",
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
                                    hintText: "UPI ID",
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
                  text: "Save UPI",
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
