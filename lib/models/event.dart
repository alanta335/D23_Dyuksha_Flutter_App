import 'package:flutter/material.dart';

enum EventCategory { workshop, proshow, nss, competition }

enum Department { cse, eee, mech, civil, ice, ece, nss }

class Event {
  final String name;
  final EventCategory category;
  final Department department;
  final int day;
  final String imageURL;
  final String about;
  final String registrationURL;
  final String time;
  final String contact;
  final String coordintorName;

  Event({
    required this.name,
    required this.category,
    required this.day,
    required this.imageURL,
    required this.about,
    required this.registrationURL,
    required this.time,
    required this.department,
    required this.contact,
    required this.coordintorName,
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

  String getCategoryValue() {
    switch (category) {
      case EventCategory.proshow:
        return "PROSHOW";
      case EventCategory.workshop:
        return "WORKSHOP";
      case EventCategory.competition:
        return "COMPETITION";
      default:
        return "EVENT";
    }
  }

  static EventCategory getCategoryFromString(String category) {
    if (category.toLowerCase().compareTo("proshow") == 0) {
      return EventCategory.proshow;
    } else if (category.toLowerCase().compareTo("workshop") == 0) {
      return EventCategory.workshop;
    } else if (category.toLowerCase().compareTo("competition") == 0) {
      return EventCategory.competition;
    }
    return EventCategory.nss;
  }

  static Department getDepartmentFromString(String department) {
    if (department.toLowerCase().compareTo("cse") == 0) {
      return Department.cse;
    } else if (department.toLowerCase().compareTo("eee") == 0) {
      return Department.eee;
    } else if (department.toLowerCase().compareTo("mech") == 0) {
      return Department.mech;
    } else if (department.toLowerCase().compareTo("civil") == 0) {
      return Department.civil;
    } else if (department.toLowerCase().compareTo("ic") == 0) {
      return Department.ice;
    } else if (department.toLowerCase().compareTo("ec") == 0) {
      return Department.ece;
    } else if (department.toLowerCase().compareTo("nss") == 0) {
      return Department.nss;
    }
    return Department.nss;
  }

  String getDepartment() {
    return department.toString().split('.')[1];
  }

  static String getDepartmentFromEnum(Department department) {
    return department.toString().split('.')[1];
  }

  factory Event.fromJson(Map<String, dynamic> json, int day) {
    return Event(
        name: json['eventname'] ?? "Event",
        registrationURL: json['ticket'] ?? "www.dyuksha.org",
        day: day,
        department: getDepartmentFromString(json['dept'] ?? "nss"),
        imageURL: json['url'] ?? "",
        time: json['time'] ?? "00:00AM",
        category: Event.getCategoryFromString(json['type'] ?? "Event"),
        about: json['description'] ?? "About",
        contact: json['contact'] ?? "0000000000",
        coordintorName: json['cntname'] ?? "Coordinator");
  }
}
