import 'package:flutter/material.dart';

//enum EventCategory { workshop, proshow }
enum Department { cse, ec, eee, mech, civil, ice }

class Event {
  final String name;
  final String eventCategory;
  final int day;
  final String imageURL;
  final String about;
  final String registrationURL;
  final String timeOfDay;
  final Department department;

  Event({
    required this.name,
    required this.eventCategory,
    required this.day,
    required this.imageURL,
    required this.about,
    required this.registrationURL,
    required this.timeOfDay,
    required this.department,
  });

  Color getColorOfDay() {
    switch (day) {
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      case 3:
        return Colors.cyan;
      default:
        return Colors.black;
    }
  }

  // String getCategoryValue() {
  //   switch (eventCategory) {
  //     case EventCategory.proshow:
  //       return "PROSHOW";
  //     case EventCategory.workshop:
  //       return "WORKSHOP";
  //     default:
  //       return "EVENT";
  //   }
  // }
}
