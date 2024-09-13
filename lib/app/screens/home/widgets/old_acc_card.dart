import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class AccCard1 extends StatelessWidget {
  final String? memberNo;
  final String? branchId;
  final String? accountId;
  final String? balance;
  const AccCard1(
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
      color: ColorPallete.primary,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/ui/glare_1.png",
              height: 75 * fem,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              "assets/ui/glare_2.png",
              height: 60 * fem,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0 * fem),
            child: Center(
              child: Image.asset(
                "assets/ui/logo_cutout.png",
              ),
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
                      TextView(
                        text: "Saving Account No. ",
                        fontSize: 12,
                        color: ColorPallete.grey.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      TextView(
                        text: accountId ?? "122122324",
                        fontSize: 12,
                        color: ColorPallete.theme,
                      ),
                    ],
                  ),
                ),
                RoundedContainer(
                  radius: 0,
                  child: MyListView(
                    children: [
                      TextView(
                        text: "Account Balance",
                        fontSize: 12,
                        color: ColorPallete.grey.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: 5 * fem,
                      ),
                      TextView(
                        text: "₹ ${balance ?? "12,000.00"}",
                        fontSize: 16,
                        color: ColorPallete.theme,
                      ),
                    ],
                  ),
                ),
                RoundedContainer(
                  radius: 0,
                  child: Row(
                    children: [
                      TextView(
                        text: "Membership No. :",
                        fontSize: 10,
                        color: ColorPallete.grey.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      TextView(
                        text: memberNo ?? "120054563",
                        fontSize: 10,
                        color: ColorPallete.theme,
                      ),
                      const Spacer(),
                      TextView(
                        text: "Branch :",
                        fontSize: 10,
                        color: ColorPallete.grey.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      TextView(
                        text: branchId ?? "Jyoti, Arnala",
                        fontSize: 10,
                        color: ColorPallete.theme,
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
