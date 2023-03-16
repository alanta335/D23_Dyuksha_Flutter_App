import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:d23_dyuksha/data/dummy_events.dart';
import 'package:d23_dyuksha/mainscreen.dart';
import 'package:d23_dyuksha/screens/event_screen/event_screen.dart';
import 'package:d23_dyuksha/screens/home.dart';
import 'package:d23_dyuksha/welcomePage.dart';
import 'package:d23_dyuksha/widgets/cypberpunk_background_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: EventScreen(event: events[0]),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          nextScreen: WelcomePage(),
          splash: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 1.0, end: 0.0),
              curve: Curves.ease,
              duration: const Duration(milliseconds: 1000),
              builder: (BuildContext context, double opacity, Widget? child) {
                return Opacity(
                    opacity: opacity,
                    child: Image.asset("assets/dyuksha_default_splash.png"));
              }),
          splashIconSize: 1000,
          duration: 1000,
          backgroundColor: Colors.black,
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.fade,
        ));
  }
}
