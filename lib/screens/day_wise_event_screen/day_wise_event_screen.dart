import 'package:flutter/material.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import '/data/dummy_events.dart';
import '/widgets/dyuksha_logo_mini.dart';
import 'cyberpunk_tab_holder.dart';
import 'event_tile.dart';

class DayWiseEventScreen extends StatefulWidget {
  const DayWiseEventScreen({super.key});

  @override
  State<DayWiseEventScreen> createState() => _DayWiseEventScreenState();
}

class _DayWiseEventScreenState extends State<DayWiseEventScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SafeArea(child: DyukshaLogoMini()),
            CyberpunkTabBarHolder(tabController: _tabController),
            const SizedBox(height: 12.0),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                ListViewBuilder(),
                ListViewBuilder(),
                ListViewBuilder(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventTile(event: events[index]);
      },
    );
  }
}



