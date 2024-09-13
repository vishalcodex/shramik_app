import 'package:flutter/material.dart';

import '../../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class MyStepper extends StatelessWidget {
  final int currentStep;
  final List<String> labels;
  const MyStepper({super.key, required this.currentStep, required this.labels});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return RoundedContainer(
      radius: 0,
      height: 75,
      child: Center(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: (labels.length * 2) - 1,
          itemBuilder: (context, index) {
            int pos = (index / 2).toInt();
            String label = labels.elementAt(pos);
            bool isSelected = pos == currentStep;
            bool isCompleted = pos <= currentStep;
            return Container(
              // color: index % 2 == 0
              //     ? ColorPallete.primaryAccent
              //     : ColorPallete.primary,
              width: index % 2 == 0
                  ? MediaQuery.of(context).size.width / (labels.length * 1.4)
                  : MediaQuery.of(context).size.width / (labels.length * 6),
              child: index % 2 != 0
                  ? MyListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.50 * fem),
                          child: Divider(
                            thickness: 2.5 * fem,
                            color: ColorPallete.grey,
                          ),
                        )
                      ],
                    )
                  : MyListView(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: isCompleted
                              ? ColorPallete.primary
                              : ColorPallete.grey.withOpacity(0.2),
                          child: TextView(
                            text: (pos + 1).toString(),
                            weight: FontWeight.bold,
                            color: isSelected || isCompleted
                                ? ColorPallete.theme
                                : ColorPallete.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        if (isSelected)
                          TextView(
                            text: label,
                            alignment: TextAlign.center,
                          )
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
