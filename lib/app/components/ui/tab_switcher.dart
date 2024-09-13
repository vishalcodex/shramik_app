import 'package:flutter/material.dart';

import '../../../common/color_pallete.dart';
import 'text_view.dart';

class TabSwitcher extends StatelessWidget {
  final List tabs;
  final bool equalWidths;
  final int? initialTab;
  final Function(int value)? onTabsChanged;
  const TabSwitcher(
      {super.key,
      required this.tabs,
      this.initialTab,
      this.equalWidths = true,
      this.onTabsChanged});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
      child: DefaultTabController(
        length: tabs.length,
        initialIndex: initialTab ?? 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PreferredSize(
              preferredSize: Size(double.infinity, 50 * fem),
              child: Container(
                color: ColorPallete.theme,
                height: 50 * fem,
                width: double.infinity,
                child: TabBar(
                    onTap: (value) {
                      onTabsChanged!(value);
                    },
                    padding: EdgeInsets.zero,
                    isScrollable: !equalWidths,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: ColorPallete.primary,
                    unselectedLabelColor: ColorPallete.grey,
                    indicatorColor: ColorPallete.primary,
                    automaticIndicatorColorAdjustment: true,
                    tabs: tabs
                        .map(
                          (e) => TextView(
                            text: e["name"],
                            alignment: TextAlign.center,
                            fontSize: equalWidths ? 14 : 12,
                            weight: FontWeight.w600,
                          ),
                        )
                        .toList()),
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: tabs.map((e) => e["view"] as Widget).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
