import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import '../../widgets/listViewFromSnapshot.dart';
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

  Query? getData(index) {
    return FirebaseFirestore.instance
        .collection('cse')
        .doc('events')
        .collection('day${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DyukshaLogoMini(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 15),
              child: CyberpunkTabBarHolder(tabController: _tabController),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                // ListViewBuilder(),
                // ListViewBuilder(),
                // ListViewBuilder(),
                ListViewFromSnapshot(
                  key: ValueKey<int>(0),
                  users: getData(0),
                ),
                ListViewFromSnapshot(
                  key: ValueKey<int>(1),
                  users: getData(1),
                ),
                ListViewFromSnapshot(
                  key: ValueKey<int>(2),
                  users: getData(2),
                ),
              ]
                  //[

                  //   ListViewFromSnapshot(
                  //     key: ValueKey<int>(1),
                  //     users: getData(1),
                  //   ),
                  //   ListViewFromSnapshot(
                  //     key: ValueKey<int>(2),
                  //     users: getData(2),
                  //   ),
                  // ]
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ListViewBuilder extends StatelessWidget {
//   const ListViewBuilder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (context, index) {
//         return EventTile(event: events[index]);
//       },
//     );
//   }
// }
