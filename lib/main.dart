import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:confetti/confetti.dart';
import 'package:d23_dyuksha/constants.dart';
import 'package:d23_dyuksha/welcomePage.dart';
import 'package:d23_dyuksha/widgets/cypberpunk_background_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  confettiControllerLeft =
      ConfettiController(duration: const Duration(seconds: 2));
  confettiControllerRight =
      ConfettiController(duration: const Duration(seconds: 2));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          nextScreen: const WelcomePage(),
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
