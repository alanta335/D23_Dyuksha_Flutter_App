import 'dart:async';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import '../models/event.dart';

class DyukshaFirestore {
  static Stream<List<Event>> getEventStreamByDay(int day) {
    final ref = FirebaseFirestore.instance
        .collection("cse")
        .doc("events")
        .collection("day$day");

    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Event.fromJson(doc.data(), day);
      }).toList();
    });
  }

  static Future<List<Event>> getEventStreamByDepartment(
      Department department) async {
    CollectionReference eventlist1 = FirebaseFirestore.instance
        .collection('cse')
        .doc("events")
        .collection("day1");
    CollectionReference eventlist2 = FirebaseFirestore.instance
        .collection('cse')
        .doc("events")
        .collection("day2");
    CollectionReference eventlist3 = FirebaseFirestore.instance
        .collection('cse')
        .doc("events")
        .collection("day3");
    final deps = Event.getDepartmentFromEnum(department);
    QuerySnapshot querySnapshot1 =
        await eventlist1.where('dept', isEqualTo: "${deps}").get();
    QuerySnapshot querySnapshot2 =
        await eventlist2.where('dept', isEqualTo: "$deps").get();
    QuerySnapshot querySnapshot3 =
        await eventlist3.where('dept', isEqualTo: "$deps").get();

    List<Event> data1 = querySnapshot1.docs
        .map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>, 1))
        .toList();
    List<Event> data2 = querySnapshot2.docs
        .map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>, 2))
        .toList();
    List<Event> data3 = querySnapshot3.docs
        .map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>, 3))
        .toList();

    List<Event> allData = [];
    allData.addAll(data1);
    allData.addAll(data2);
    allData.addAll(data3);
    return allData;
  }
}
