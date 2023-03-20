import 'dart:math';
import 'dart:ui';
import 'package:animated_text/animated_text.dart';
import 'package:d23_dyuksha/screens/day_wise_event_screen/day_wise_event_screen.dart';
import 'package:d23_dyuksha/screens/home_screen/home_screen.dart';
import 'package:d23_dyuksha/screens/about_screen/about_screen.dart';
import 'package:d23_dyuksha/screens/talk_with_rj_screen/talk_with_rj_screen.dart';
import 'package:d23_dyuksha/widgets/customScrollPhysics.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _pageViewController = PageController();

  int _currentIndex = 0;
  int counter = 0;
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
    if (mounted) {
      confettiControllerLeft.addListener(() {
        Future.delayed(const Duration(seconds: 4), () {
          _showDialog(context);
        });
      });
    }
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

  void _showDialog(BuildContext context) {
    print(context);
    if (counter == 1) {
      setState(() {
        counter = 0;
      });
    } else {
      setState(() {
        counter = 1;
      });
      showDialog(
        context: context,
        builder: (_) => Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/cyber_city.jpg"),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        GlitchEffect(
                          duration: const Duration(seconds: 3),
                          colors: const [
                            Colors.black,
                            Colors.red,
                            Colors.blue,
                            Colors.purple
                          ],
                          child: Text(
                            "CREDITS",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.chakraPetch(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: AnimatedText(
                        alignment: Alignment.center,
                        speed: const Duration(milliseconds: 1000),
                        controller: AnimatedTextController.loop,
                        displayTime: const Duration(milliseconds: 1000),
                        wordList: const [
                          'DEVELOPERS',
                          'HARIKRISHNAN B A',
                          'ALAN T A',
                          'AKHIL KRISHNA S',
                          'ANOOP P K',
                          'DESIGN TEAM',
                          'ABHIN SURESH S',
                          'ALEENA KT',
                          'SHYAM KRISHNAN',
                          'SPECIAL MENTION',
                          'ABHISHEK P V',
                          'JOSEPH FERNANDEZ',
                        ],
                        textStyle: GoogleFonts.merienda(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: AnimatedText(
                        alignment: Alignment.center,
                        speed: const Duration(milliseconds: 1000),
                        controller: AnimatedTextController.loop,
                        displayTime: const Duration(milliseconds: 1000),
                        wordList: const [
                          '',
                          '@me.harikrish',
                          '@alan_ta_335',
                          '@ilmentore72',
                          '@ichbin_anoop',
                          '',
                          '@kiyoshi_abhin',
                          '@aleena_k_t',
                          '@shhyaaam',
                          '',
                          '@_abishek_pv',
                          '@joseph._fernandez',
                        ],
                        textStyle: GoogleFonts.cutiveMono(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 42,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
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
