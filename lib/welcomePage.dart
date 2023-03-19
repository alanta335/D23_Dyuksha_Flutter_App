import 'dart:math';
import 'package:d23_dyuksha/screens/day_wise_event_screen/day_wise_event_screen.dart';
import 'package:d23_dyuksha/screens/home_screen/home_screen.dart';
import 'package:d23_dyuksha/screens/about_screen/about_screen.dart';
import 'package:d23_dyuksha/screens/talk_with_rj_screen/talk_with_rj_screen.dart';
import 'package:d23_dyuksha/widgets/customScrollPhysics.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _pageViewController = PageController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        isSendButtonPressed = false;
      });
    }
    _pageViewController.addListener(() {
      buttonClickCount = 0;
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void _sendMessageTimerDelegate() {
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        setState(() {
          isSendButtonPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: (int index) {
                setState(() {
                  _pageViewController.animateToPage(
                    curve: Curves.linear,
                    index,
                    duration: const Duration(milliseconds: 200),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            physics: const CustomPageViewScrollPhysics(),
            controller: _pageViewController,
            children: [
              HomeScreen(),
              TalkWithRJScreen(timerDelegate: _sendMessageTimerDelegate),
              const DayWiseEventScreen(),
              const AboutScreen(),
            ],
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              maximumSize: const Size(30, 30),
              shouldLoop: false,
              confettiController: confettiControllerLeft,
              blastDirection: pi / 4,
              blastDirectionality: BlastDirectionality.directional,
              maxBlastForce: 20,
              minBlastForce: 8,
              emissionFrequency: 1,
              numberOfParticles: 8,
              gravity: 1,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              maximumSize: const Size(30, 30),
              shouldLoop: false,
              confettiController: confettiControllerRight,
              blastDirection: 0,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 20,
              minBlastForce: 8,
              emissionFrequency: 1,
              numberOfParticles: 8,
              gravity: 1,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              maximumSize: const Size(30, 30),
              shouldLoop: false,
              confettiController: confettiControllerRight,
              blastDirection: pi,
              blastDirectionality: BlastDirectionality.directional,
              maxBlastForce: 20,
              minBlastForce: 8,
              emissionFrequency: 1,
              numberOfParticles: 8,
              gravity: 1,
            ),
          ),
        ],
      ),
    );
  }
}
