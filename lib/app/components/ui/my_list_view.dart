import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final bool? isRow;
  final bool? scroll;
  final List<Widget>? children;
  const MyListView({super.key, this.isRow, this.scroll, this.children});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: scroll ?? false ? null : NeverScrollableScrollPhysics(),
      scrollDirection: isRow ?? false ? Axis.horizontal : Axis.vertical,
      children: children ?? [],
    );
  }
}
