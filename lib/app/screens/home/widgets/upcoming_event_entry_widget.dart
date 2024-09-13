import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class UpcomingEventEntryWidget extends StatefulWidget {
  final Map event;
  const UpcomingEventEntryWidget({super.key, required this.event});

  @override
  State<UpcomingEventEntryWidget> createState() =>
      _UpcomingEventEntryWidgetState();
}

class _UpcomingEventEntryWidgetState extends State<UpcomingEventEntryWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 0,
      child: MyListView(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: RoundedContainer(
                radius: 10,
                borderColor: Color(0xff009AE0),
                color: selected
                    ? Color(0xff009AE0)
                    : Color(0xff009AE0).withOpacity(0.2),
                height: 45,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10 * fem,
                    ),
                    TextView(
                      text: widget.event["name"],
                      color: selected
                          ? ColorPallete.theme
                          : ColorPallete.secondary,
                      fontSize: 16,
                    ),
                  ],
                )),
          ),
          if (selected)
            Padding(
              padding: EdgeInsets.only(top: 5.0 * fem),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                child: RoundedContainer(
                  radius: 5,
                  height: 100,
                  borderColor: ColorPallete.grey,
                  color: ColorPallete.theme,
                  child: Padding(
                    padding: EdgeInsets.all(10.0 * fem),
                    child: MyListView(
                      children: [
                        const TextView(
                          text: "Event",
                          color: ColorPallete.secondary,
                        ),
                        TextView(
                          text: widget.event["name"],
                          color: ColorPallete.secondary,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyListView(
                                children: [
                                  const TextView(
                                    text: "Inventory",
                                    color: ColorPallete.secondary,
                                  ),
                                  TextView(
                                    text: widget.event["inventory"],
                                    color: ColorPallete.secondary,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: MyListView(
                                children: [
                                  const TextView(
                                    text: "Vehicle",
                                    color: ColorPallete.secondary,
                                  ),
                                  TextView(
                                    text: widget.event["vehicle"],
                                    color: ColorPallete.secondary,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
