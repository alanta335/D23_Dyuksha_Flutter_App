import 'package:flutter/material.dart';

import 'clippers.dart';
import 'day_tab_bar.dart';

class CyberpunkTabBarHolder extends StatefulWidget {
  const CyberpunkTabBarHolder({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<CyberpunkTabBarHolder> createState() => _CyberpunkTabBarHolderState();
}

class _CyberpunkTabBarHolderState extends State<CyberpunkTabBarHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      color: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DayTabBar(
              width: constraints.maxWidth / 3 - 2.0,
              clipper: DayOneTabBarClipper(),
              color: Colors.yellow,
              label: 'DAY 1',
              onTap: () => widget.tabController.animateTo(0),
              isSelected: widget.tabController.index == 0,
            ),
            DayTabBar(
              width: constraints.maxWidth / 3 - 2.0,
              clipper: DayTwoClipper(),
              label: "DAY 2",
              color: Colors.red,
              onTap: () => widget.tabController.animateTo(1),
              isSelected: widget.tabController.index == 1,
            ),
            DayTabBar(
              width: constraints.maxWidth / 3 - 2.0,
              clipper: DayThreeClipper(),
              label: "DAY 3",
              color: Colors.cyan,
              onTap: () => widget.tabController.animateTo(2),
              isSelected: widget.tabController.index == 2,
            ),
          ],
        );
      }),
    );
  }
}
