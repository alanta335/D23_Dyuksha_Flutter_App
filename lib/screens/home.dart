import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d23_dyuksha/models/event.dart';
import 'package:d23_dyuksha/screens/department_event_screen/department_event_screen.dart';
import 'package:d23_dyuksha/widgets/cyberpunk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/dummy_events.dart';
import '../widgets/cypberpunk_background_scaffold.dart';
import 'event_screen/event_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const double pad_btw = 30.0;
    var carousel_list1 = {
      "civil":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/civil.jpg?alt=media&token=df345261-5f43-4a1b-9103-ff1a30a919c2",
      "cse":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/cse.jpg?alt=media&token=acff8732-9cae-4813-a8de-e9f2fe4b0806",
      "ece":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/ece.jpg?alt=media&token=64a0cee9-97c2-425d-96d5-7c64390c733e",
      "eee":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/eee.jpg?alt=media&token=1934f554-b606-4a1a-9398-cfb5cb2a918c",
      "ice":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/ice.jpg?alt=media&token=46ebb572-5c32-4ce0-8acb-87bcca7201da",
      "mech":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/mech.jpg?alt=media&token=4936ba43-5624-4961-b9ed-c08f87e27aed"
    };
    var namelist1 = ["civil", "cse", "ece", "eee", "ice", "mech"];
    var carousel_list2 = {
      "day1":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/proshow%2Fpro1.jpg?alt=media&token=1e5779c7-021d-48ac-bc1a-ca5c3664a4db",
      "day2":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/proshow%2Fpro1.jpg?alt=media&token=1e5779c7-021d-48ac-bc1a-ca5c3664a4db",
      "day3":
          "https://firebasestorage.googleapis.com/v0/b/d23dyuksha.appspot.com/o/proshow%2Fpro3.jpg?alt=media&token=539ebe3b-6465-43d9-8a0b-adf171330862",
    };
    var namelist2 = ["day1", "day2", "day3"];

    return CyberpunkBackgroundScaffold(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: pad_btw,
              ),
              Image(
                image: AssetImage("assets/images/d23_logo_text.png"),
                width: width * 0.5,
              ),
              SizedBox(
                height: pad_btw,
              ),
              CarouselSlider.builder(
                itemCount: carousel_list2.length,
                options: CarouselOptions(
                    height: 300.0,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                    viewportFraction: 1),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  print("$pageViewIndex,$itemIndex");
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) =>
                              EventScreen(event: events[itemIndex])));
                    },
                    child: Container(
                      width: width * 0.8,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Image.network(
                        carousel_list2[namelist2[itemIndex]]!,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.low,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: pad_btw,
              ),
              Expanded(
                child: Container(
                    child: Column(
                  children: [
                    CyberpunkButton(
                      color: Colors.red,
                      label: 'Book Now',
                      onTap: () {},
                    ),
                    Text(
                      'Department',
                      style: GoogleFonts.chakraPetch(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: pad_btw,
                    ),
                    CarouselSlider.builder(
                      itemCount: carousel_list1.length,
                      options: CarouselOptions(
                          height: 200.0,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.4,
                          viewportFraction: 0.5),
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        print("$pageViewIndex,$itemIndex");
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  DepartmentEventScreen(dep: Department.cse),
                            ),
                          ),
                          child: Container(
                            width: width * 0.8,
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Image.network(
                              carousel_list1[namelist1[itemIndex]]!,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.low,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
