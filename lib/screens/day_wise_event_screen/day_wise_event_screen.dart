import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d23_dyuksha/models/event.dart';
import 'package:d23_dyuksha/services/firestore_wrapper.dart';
import 'package:d23_dyuksha/widgets/list_item_builder.dart';
import 'package:flutter/material.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
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
    _tabController.addListener(() {
      setState(() {});
    });
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12.0),
              DyukshaLogoMini(),
              const SizedBox(height: 20),
              CyberpunkTabBarHolder(tabController: _tabController),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    ListViewBuilder(day: 1),
                    ListViewBuilder(day: 2),
                    ListViewBuilder(day: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  final int day;
  const ListViewBuilder({
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Event>>(
      stream: DyukshaFirestore.getEventStreamByDay(day),
      builder: (context, snapshot) => ListItemBuilder(
        snapshot: snapshot,
        itemBuilder: (_, event) => EventTile(event: event),
      ),
    );
  }
}
