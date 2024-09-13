import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class MyPurchasedRSDWidget extends StatefulWidget {
  final Map<String, dynamic> rsd;
  const MyPurchasedRSDWidget({super.key, required this.rsd});

  @override
  State<MyPurchasedRSDWidget> createState() => _MyPurchasedRSDWidgetState();
}

class _MyPurchasedRSDWidgetState extends State<MyPurchasedRSDWidget> {
  bool showTransactions = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 10,
      clip: Clip.antiAliasWithSaveLayer,
      borderColor: ColorPallete.greyDivider,
      child: MyListView(
        children: [
          SizedBox(
            height: 15 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: widget.rsd["name"],
                  fontSize: 18,
                  color: ColorPallete.secondary,
                ),
                RoundedContainer(
                  radius: 5,
                  color: ColorPallete.primaryAccent.withOpacity(0.2),
                  child: Padding(
                    padding: EdgeInsets.all(5.0 * fem),
                    child: TextView(
                      text: widget.rsd["description"],
                      color: ColorPallete.primaryAccent,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  text: "RSD Amount",
                  color: ColorPallete.grey,
                  weight: FontWeight.w400,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0 * fem),
                  child: TextView(
                    text: widget.rsd["rsd_amt"],
                    fontSize: 16,
                    color: ColorPallete.primary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  text: "Buying Limit",
                  color: ColorPallete.grey,
                  weight: FontWeight.w400,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0 * fem),
                  child: TextView(
                    text: widget.rsd["vehicle_limit"],
                    fontSize: 16,
                    color: ColorPallete.secondary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  text: "Credit Limit",
                  color: ColorPallete.grey,
                  weight: FontWeight.w400,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0 * fem),
                  child: TextView(
                    text: widget.rsd["credit_limit"],
                    fontSize: 16,
                    color: ColorPallete.secondary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5 * fem,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
            child: const Row(
              children: [Spacer(), TextView(text: "Upgrade Limit")],
            ),
          ),
          SizedBox(
            height: 10 * fem,
          ),
          Divider(
            height: 5 * fem,
            thickness: 1 * fem,
            color: ColorPallete.greyDivider,
          ),
          SizedBox(
            height: 10 * fem,
          ),
          InkWell(
            onTap: () {
              setState(() {
                showTransactions = !showTransactions;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
              child: Row(
                children: [
                  const TextView(
                    text: "Transactions",
                    fontSize: 18,
                    color: ColorPallete.secondary,
                  ),
                  const Spacer(),
                  Transform.rotate(
                    angle: showTransactions ? pi / 2 : 0,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15 * fem,
                      color: ColorPallete.secondary,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15 * fem,
          ),
          if (showTransactions)
            RoundedContainer(
                radius: 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: (widget.rsd["transactions"] as List).length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> e =
                        (widget.rsd["transactions"] as List)[index];
                    return RoundedContainer(
                      radius: 0,
                      color: index % 2 == 0
                          ? ColorPallete.theme
                          : ColorPallete.greyDivider.withOpacity(0.5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0 * fem, horizontal: 15 * fem),
                        child: RoundedContainer(
                            radius: 0,
                            child: MyListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: e["vehicle_no"],
                                      color: ColorPallete.secondary,
                                      fontSize: 14,
                                    ),
                                    TextView(
                                      text: "\$ " + e["amt"],
                                      color: e["status"] == "RELEASED"
                                          ? Colors.green
                                          : ColorPallete.red,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: e["date"],
                                      color: ColorPallete.secondary,
                                      fontSize: 12,
                                      weight: FontWeight.w400,
                                    ),
                                    TextView(
                                      text: e["status"],
                                      color: ColorPallete.secondary,
                                      fontSize: 12,
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  },
                ))
        ],
      ),
    );
  }
}
