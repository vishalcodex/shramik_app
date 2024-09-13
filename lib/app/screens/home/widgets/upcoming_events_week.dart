import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';
import 'upcoming_event_entry_widget.dart';

class UpcomingEventWeek extends GetView<HomeController> {
  final Map week;
  const UpcomingEventWeek({super.key, required this.week});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 0,
      child: MyListView(children: [
        RoundedContainer(
          height: 40,
          radius: 0,
          child: Row(
            children: [
              SizedBox(
                width: 60 * fem,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                child: TextView(
                  text: week["week"],
                  fontSize: 14,
                  weight: FontWeight.w400,
                  color: ColorPallete.secondary,
                ),
              ),
              const Spacer()
            ],
          ),
        ),
        MyListView(
            children: (week["dates"] as List).map((e) {
          return Padding(
            padding:
                EdgeInsets.symmetric(vertical: 5.0 * fem, horizontal: 5 * fem),
            child: RoundedContainer(
              radius: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  RoundedContainer(
                    radius: 0,
                    width: 60,
                    height: 50,
                    // color: Colors.red,
                    child: Center(
                      child: MyListView(
                        children: [
                          Center(
                              child: TextView(
                            text: controller.getWeekDay(e["date"]),
                            fontSize: 14,
                            weight: FontWeight.w500,
                            color: ColorPallete.secondary,
                          )),
                          Center(
                              child: TextView(
                            text: controller.getDate(e["date"]),
                            fontSize: 20,
                            weight: FontWeight.w400,
                            color: ColorPallete.secondary,
                          )),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      child: MyListView(
                          children: (e["events"] as List)
                              .map((event) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 5.0 * fem),
                                  child:
                                      UpcomingEventEntryWidget(event: event)))
                              .toList())),
                ],
              ),
            ),
          );
        }).toList()),
      ]),
    );
  }
}
