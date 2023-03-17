import 'package:d23_dyuksha/screens/day_wise_event_screen/day_wise_event_screen.dart';
import 'package:d23_dyuksha/widgets/FadeIndexedStack.dart';
import 'package:d23_dyuksha/mainscreen.dart';
import 'package:d23_dyuksha/screens/about_screen/about_screen.dart';
import 'package:d23_dyuksha/screens/event_screen/event_screen.dart';
import 'package:d23_dyuksha/screens/home.dart';
import 'package:d23_dyuksha/screens/talk_with_rj_screen/talk_with_rj_screen.dart';
import 'package:d23_dyuksha/widgets/customScrollPhysics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'data/dummy_events.dart';
import 'main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _pageViewController = PageController();
  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  var pageList = <Widget>[
    Home(),
    TalkWithRJScreen(),
    DayWiseEventScreen(),
    AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // return Stack(children: [
    //   Image.asset(
    //     "assets/images/cyber_city.jpg",
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     fit: BoxFit.cover,
    //   ),
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              //backgroundColor: Colors.transparent,
              onTap: (int index) {
                setState(() {
                  _pageViewController.animateToPage(
                    curve: Curves.linear,
                    index,
                    duration: Duration(milliseconds: 200),
                  );
                });
              },
              backgroundColor: Colors.white.withOpacity(0.2),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/house-2.png")),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/radio.png")),
                    label: "talkWithRJ"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/video-time.png")),
                    label: "Schedule"),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/icons/profile-2user.png")),
                    label: "About")
              ]),
        ),
      ),
      body: PageView(
        physics: const CustomPageViewScrollPhysics(),
        controller: _pageViewController,
        children: pageList,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // body: FadeIndexedStack(
      //   index: _currentIndex,
      //   children: pageList,
      // ),
    );
  }
}
