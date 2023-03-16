import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_clipper.dart';
import 'widgets/cypberpunk_background_scaffold.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

Query users = FirebaseFirestore.instance
    .collection('cse')
    .doc('events')
    .collection('day1');

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    int day = 1;

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("asdasdasd----error-----");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CyberpunkBackgroundScaffold(
            child: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        print("${snapshot.data!.docs}============");
        return CyberpunkBackgroundScaffold(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              day = 1;
                              users = FirebaseFirestore.instance
                                  .collection('cse')
                                  .doc('events')
                                  .collection('day1');
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Color.fromARGB(255, 253, 1, 47),
                            child: Center(
                              child: Text(
                                "day 1",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 15,
                            height: 100,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              day = 2;
                              users = FirebaseFirestore.instance
                                  .collection('cse')
                                  .doc('events')
                                  .collection('day2');
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Color.fromARGB(255, 250, 255, 6),
                            child: Center(
                              child: Text(
                                "day 2",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 15,
                            height: 100,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              day = 3;
                              users = FirebaseFirestore.instance
                                  .collection('cse')
                                  .doc('events')
                                  .collection('day3');
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Color.fromARGB(255, 2, 214, 242),
                            child: Center(
                              child: Text(
                                "day 3",
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      addAutomaticKeepAlives: false,
                      cacheExtent: 300,
                      reverse: false,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return ClipPath(
                          clipper: ListClipper(clipDistance: 0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.network('${document['url']}'),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                      height: 100,
                                      color: Color.fromARGB(180, 0, 0, 0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${document['eventname']}",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${document['type']} \n ${document['time']}",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(161, 0, 0, 0)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.9);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
