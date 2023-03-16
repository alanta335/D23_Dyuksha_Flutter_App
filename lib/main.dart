import 'package:d23_dyuksha/mainscreen.dart';
import 'package:d23_dyuksha/widgets/cypberpunk_background_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  int flag = await GoogleSignInProvider().googleLogin();
                  if (flag == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const homeScreen()));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const mainScreen()));
                  }
                },
                child: const Text("Login Using Google"))
          ],
        ),
      ),
    );
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future<int> googleLogin() async {
    int flag = -1;
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return -1;
      }
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (authResult.additionalUserInfo!.isNewUser) {
        print("This is a new user");
        flag = 1;
      } else {
        print("Already exist");
        flag = 0;
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    return flag;
  }

  Future loggedout(BuildContext context) async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      notifyListeners();
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }
}
