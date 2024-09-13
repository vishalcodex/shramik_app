import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class AccCard extends StatelessWidget {
  final String? memberNo;
  final String? branchId;
  final String? accountId;
  final String? balance;
  const AccCard(
      {super.key,
      required this.memberNo,
      required this.branchId,
      required this.accountId,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 10,
      color: Color(0xff13153B),
      height: 150,
      child: Stack(
        children: [
          Positioned(
            left: 10 * fem,
            top: 10 * fem,
            child: Image.asset(
              "assets/ui/card_logo.png",
              width: 125 * fem,
            ),
          ),
          Positioned(
            left: 0 * fem,
            bottom: 0 * fem,
            child: Image.asset(
              "assets/ui/home_card_bg.png",
              color: ColorPallete.theme,
              width: 200 * fem,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0 * fem),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedContainer(
                  radius: 0,
                  child: Row(
                    children: [
                      // Image.asset(
                      //   "assets/ui/card_logo.png",
                      //   width: 125 * fem,
                      // ),
                      const Spacer(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextView(
                              text: "Branch :",
                              fontSize: 12,
                              color: ColorPallete.grey.withOpacity(0.8),
                            ),
                            SizedBox(
                              width: 10 * fem,
                            ),
                            TextView(
                              text: branchId ?? "122122324",
                              fontSize: 12,
                              color: ColorPallete.theme,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedContainer(
                  radius: 0,
                  child: MyListView(
                    children: [
                      Center(
                        child: TextView(
                          text: "Account Balance",
                          fontSize: 12,
                          color: ColorPallete.grey.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 5 * fem,
                      ),
                      Center(
                        child: TextView(
                          text: "₹ ${balance ?? "12,000.00"}",
                          fontSize: 18,
                          color: ColorPallete.theme,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedContainer(
                  radius: 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyListView(
                          children: [
                            TextView(
                              text: "Primary A/C No.",
                              fontSize: 10,
                              color: ColorPallete.grey.withOpacity(0.8),
                            ),
                            SizedBox(
                              height: 5 * fem,
                            ),
                            TextView(
                              text: accountId ?? "123456789012",
                              fontSize: 12,
                              color: ColorPallete.theme,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: MyListView(
                          children: [
                            TextView(
                              text: "Membership No.",
                              fontSize: 10,
                              color: ColorPallete.grey.withOpacity(0.8),
                            ),
                            SizedBox(
                              height: 5 * fem,
                            ),
                            TextView(
                              text: memberNo ?? "120054563",
                              fontSize: 12,
                              color: ColorPallete.theme,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
