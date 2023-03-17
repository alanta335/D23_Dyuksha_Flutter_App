import 'package:flutter/material.dart';

import 'clippers.dart';
import 'day_tab_bar.dart';

class CyberpunkTabBarHolder extends StatelessWidget {
  const CyberpunkTabBarHolder({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

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
              onTap: () => _tabController.animateTo(0),
            ),
            DayTabBar(
              width: constraints.maxWidth / 3 - 2.0,
              clipper: DayTwoClipper(),
              label: "DAY 2",
              color: Colors.red,
              onTap: () => _tabController.animateTo(1),
            ),
            DayTabBar(
              width: constraints.maxWidth / 3 - 2.0,
              clipper: DayThreeClipper(),
              label: "DAY 3",
              color: Colors.cyan,
              onTap: () => _tabController.animateTo(2),
            ),
          ],
        );
      }),
    );
  }
}
