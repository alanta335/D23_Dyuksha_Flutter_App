import 'package:d23_dyuksha/models/event.dart';
import 'package:d23_dyuksha/services/firebase_storage_wrapper.dart';
import 'package:d23_dyuksha/services/firestore_wrapper.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import 'package:flutter/material.dart';

import 'dark_button_group.dart';
import 'image_holder.dart';

class DepartmentEventScreen extends StatefulWidget {
  final Department department;
  const DepartmentEventScreen({
    required this.department,
    super.key,
  });

  @override
  State<DepartmentEventScreen> createState() => _DepartmentEventScreenState();
}

class _DepartmentEventScreenState extends State<DepartmentEventScreen> {
  Event event = Event(
    about: "Loading...",
    category: EventCategory.nss,
    contact: "0000000000",
    coordintorName: "Loading...",
    day: 1,
    department: Department.nss,
    imageURL: "",
    name: "Loading...",
    registrationURL: "https://www.dyuksha.org",
    time: "00:00AM",
  );

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SafeArea(child: SizedBox()),
            Expanded(
              flex: 2,
              child: FutureBuilder(
                future: DyukshaFirestore.getEventStreamByDepartment(
                    widget.department),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Event> events = snapshot.data!;
                    events.retainWhere(
                        (event) => event.department == widget.department);
                    return ImageHolder(
                      onIndexChanged: (index) {
                        setState(() {
                          print(index);
                          event = events[index];
                          print(events[index].name);
                        });
                      },
                      department: widget.department,
                      departmentEvents: events,
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.cyan.withOpacity(0.6),
                    ));
                  }
                },
              ),
            ),
            Expanded(
              child: DarkButtonGroup(event: event),
            ),
          ],
        ),
      ),
    );
  }
}
