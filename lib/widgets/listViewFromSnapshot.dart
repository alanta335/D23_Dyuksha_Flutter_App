import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';
import '../screens/day_wise_event_screen/event_tile.dart';
import 'cypberpunk_background_scaffold.dart';
import '../models/event.dart';

class ListViewFromSnapshot extends StatefulWidget {
  final Query? users;

  const ListViewFromSnapshot({key, this.users}) : super(key: key);
  @override
  State<ListViewFromSnapshot> createState() => _ListViewFromSnapshotState();
}

class _ListViewFromSnapshotState extends State<ListViewFromSnapshot> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.users!.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("asdasdasd----error-----");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CyberpunkBackgroundScaffold(
              child: Center(child: CircularProgressIndicator()));
        }

        return ListView(
          addAutomaticKeepAlives: true,
          cacheExtent: 300,
          reverse: false,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            var ename = document['eventname'].toString();
            var ticketURL = document['ticket'].toString();
            print(ticketURL);
            Event e = Event(
                contact: "34535433453",
                coordintorName: "Dharmanjan Bolgatty",
                department: Department.cse,
                name: ename,
                category: document['type'],
                day: 1,
                imageURL: document['url'],
                about: document['description'],
                registrationURL: ticketURL,
                time: "09:00PM");

            return EventTile(
              event: e,
            );
          }).toList(),
        );
      },
    );
  }
}
