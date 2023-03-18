import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/event.dart';
import '../../widgets/cypberpunk_background_scaffold.dart';
//import '../../data/data.dart';
import '../../widgets/cyberpunk_button.dart';
import '../department_event_screen/department_event_screen.dart';
import '../event_screen/event_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _bookShow(BuildContext context) async {
    final result = await launchUrl(
        mode: LaunchMode.externalApplication,
        Uri.parse("https://www.dyuksha.org/proshows"));
    if (!result) {
      if (!context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("Please check your internet connection and try again.")));
      }
    }
  }

  late List<Event> events;

  Future getData() async {
    CollectionReference proshow =
        FirebaseFirestore.instance.collection('events');
    //.collection("day3");
    QuerySnapshot q = await proshow.get();
    events = q.docs
        .map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>, 1))
        .toList();
    setState(() {
      loaded = true;
    });
  }

  var loaded = false;
  @override
  Widget build(BuildContext context) {
    getData();

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
          //SizedBox(height)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: SizedBox(
              height: 320,
              child: (loaded)
                  ? CarouselSlider.builder(
                      itemCount: events.length,
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.width * 0.75,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.4,
                          viewportFraction: 0.75),
                      itemBuilder: (context, index, realIndex) =>
                          GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  EventScreen(event: events[index])));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(events[index].imageURL,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                                errorBuilder: (_, __, ___) {
                              return Image.asset(
                                'assets/images/placeholder_dyuksha.jpg',
                                fit: BoxFit.cover,
                              );
                            }, loadingBuilder: (_, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              double progress =
                                  loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                          .toDouble();
                              return Container(
                                color: Colors.white.withOpacity(0.2),
                                child: Transform.scale(
                                  scale: progress,
                                  child: Container(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        // child: Container(
                        //   width: MediaQuery.of(context).size.width * 0.8,
                        //   margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(16.0),
                        //     child: Image.network(
                        //       events[index].imageURL,
                        //       fit: BoxFit.cover,
                        //       filterQuality: FilterQuality.low,
                        //     ),
                        //   ),
                        // ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          CyberpunkButton(
            color: Colors.red,
            label: 'BOOK NOW',
            onTap: () {
              launchUrl(Uri.parse("https://www.yepdesk.com/profile/dyuksha"),
                  mode: LaunchMode.externalApplication);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              'Department',
              textAlign: TextAlign.center,
              style: GoogleFonts.chakraPetch(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
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
                        department: deps[itemIndex].department,
                      ),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Image.network(deps[itemIndex].imageURL,
                        fit: BoxFit.contain, filterQuality: FilterQuality.high,
                        errorBuilder: (_, __, ___) {
                      return Image.asset(
                        'assets/images/placeholder_dyuksha.jpg',
                        fit: BoxFit.cover,
                      );
                    }, loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      double progress = loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!.toDouble();
                      return Container(
                        color: Colors.white.withOpacity(0.2),
                        child: Transform.scale(
                          scale: progress,
                          child: Container(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 70.0),
        ]),
      ),
    );
  }
}

List<Event> deps = [
  Event(
    contact: "1234567890",
    coordintorName: "Dharmajan Bolgatty",
    department: Department.cse,
    time: "09:00AM",
    name: 'CSE',
    day: 1,
    category: EventCategory.competition,
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/cse.jpg?alt=media&token=acff8732-9cae-4813-a8de-e9f2fe4b0806',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    contact: "1234567890",
    coordintorName: "Dharmajan Bolgatty",
    department: Department.mech,
    time: "09:00AM",
    name: 'MECH',
    day: 1,
    category: EventCategory.competition,
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/mech.jpg?alt=media&token=4936ba43-5624-4961-b9ed-c08f87e27aed',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    contact: "1234567890",
    coordintorName: "Dharmajan Bolgatty",
    department: Department.civil,
    time: "09:00AM",
    name: 'CIVIL',
    day: 1,
    category: EventCategory.competition,
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/civil.jpg?alt=media&token=df345261-5f43-4a1b-9103-ff1a30a919c2',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    contact: "1234567890",
    coordintorName: "Dharmajan Bolgatty",
    department: Department.eee,
    time: "09:00AM",
    name: 'EEE',
    day: 1,
    category: EventCategory.competition,
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/eee.jpg?alt=media&token=1934f554-b606-4a1a-9398-cfb5cb2a918c',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    contact: "1234567890",
    coordintorName: "Dharmajan Bolgatty",
    department: Department.ece,
    time: "09:00AM",
    name: 'ECE',
    day: 1,
    category: EventCategory.competition,
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/ece.jpg?alt=media&token=64a0cee9-97c2-425d-96d5-7c64390c733e',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
  Event(
    contact: "1234567890",
    coordintorName: "Dharmajan Bolgatty",
    department: Department.ice,
    time: "09:00AM",
    name: 'ICE',
    day: 1,
    category: EventCategory.competition,
    imageURL:
        'https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/ice.jpg?alt=media&token=46ebb572-5c32-4ce0-8acb-87bcca7201da',
    registrationURL: "https://www.yepdesk.com/profile/dyuksha",
    about: "Lorem",
  ),
];
