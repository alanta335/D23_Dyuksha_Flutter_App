import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/event.dart';
import '../../widgets/cypberpunk_background_scaffold.dart';
import '/data/dummy_events.dart';
import '../../widgets/cyberpunk_button.dart';
import '../department_event_screen/department_event_screen.dart';
import '../event_screen/event_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Transform.scale(
          scale: 0.55,
          child: Image.asset(
            "assets/images/d23_logo_text.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 320,
            child: CarouselSlider.builder(
              itemCount: events.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.width * 0.75,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  viewportFraction: 0.75),
              itemBuilder: (context, index, realIndex) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => EventScreen(event: events[index])));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      events[index].imageURL,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CyberpunkButton(
            color: Colors.red,
            label: 'BOOK NOW',
            onTap: () {},
          ),
          Text(
            'Department',
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 220.0,
            child: CarouselSlider.builder(
              itemCount: deps.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.5,
                enlargeCenterPage: true,
                enlargeFactor: 0.5,
                viewportFraction: 0.5,
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DepartmentEventScreen(
                          dep: deps[itemIndex].department),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Image.network(
                      deps[itemIndex].imageURL,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 60.0),
        ]),
      ),
    );
  }
}

List<Event> deps = [
  Event(
    department: Department.cse,
    timeOfDay: TimeOfDay.now().toString(),
    name: 'CSE',
    day: 1,
    eventCategory: "dep",
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/cse.jpg?alt=media&token=acff8732-9cae-4813-a8de-e9f2fe4b0806',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    department: Department.mech,
    timeOfDay: TimeOfDay.now().toString(),
    name: 'MECH',
    day: 1,
    eventCategory: "dep",
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/mech.jpg?alt=media&token=4936ba43-5624-4961-b9ed-c08f87e27aed',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    department: Department.civil,
    timeOfDay: TimeOfDay.now().toString(),
    name: 'CIVIL',
    day: 1,
    eventCategory: "dep",
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/civil.jpg?alt=media&token=df345261-5f43-4a1b-9103-ff1a30a919c2',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    department: Department.eee,
    timeOfDay: TimeOfDay.now().toString(),
    name: 'EEE',
    day: 1,
    eventCategory: "dep",
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/eee.jpg?alt=media&token=1934f554-b606-4a1a-9398-cfb5cb2a918c',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    department: Department.ec,
    timeOfDay: TimeOfDay.now().toString(),
    name: 'ECE',
    day: 1,
    eventCategory: "dep",
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/ece.jpg?alt=media&token=64a0cee9-97c2-425d-96d5-7c64390c733e',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    department: Department.ice,
    timeOfDay: TimeOfDay.now().toString(),
    name: 'ICE',
    day: 1,
    eventCategory: "dep",
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/ice.jpg?alt=media&token=46ebb572-5c32-4ce0-8acb-87bcca7201da',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
];
