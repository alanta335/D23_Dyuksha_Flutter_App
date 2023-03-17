import 'package:d23_dyuksha/data/dummy_events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_clipper.dart';
import 'screens/day_wise_event_screen/clippers.dart';
import 'screens/day_wise_event_screen/cyberpunk_tab_holder.dart';
import 'screens/day_wise_event_screen/day_tab_bar.dart';
import 'widgets/cypberpunk_background_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

Query users = FirebaseFirestore.instance
    .collection('cse')
    .doc('events')
    .collection('day1');

class _mainScreenState extends State<mainScreen>
    with
        AutomaticKeepAliveClientMixin<mainScreen>,
        SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    height: 40.0,
                    color: Colors.transparent,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DayTabBar(
                            width: constraints.maxWidth / 3 - 2.0,
                            clipper: DayOneTabBarClipper(),
                            color: Color.fromARGB(255, 250, 255, 6),
                            label: 'DAY 1',
                            onTap: () {
                              setState(() {
                                users = FirebaseFirestore.instance
                                    .collection('cse')
                                    .doc('events')
                                    .collection('day1');
                              });
                            },
                          ),
                          DayTabBar(
                            width: constraints.maxWidth / 3 - 2.0,
                            clipper: DayTwoClipper(),
                            label: "DAY 2",
                            color: Color.fromARGB(255, 253, 1, 47),
                            onTap: () {
                              setState(() {
                                users = FirebaseFirestore.instance
                                    .collection('cse')
                                    .doc('events')
                                    .collection('day2');
                              });
                            },
                          ),
                          DayTabBar(
                            width: constraints.maxWidth / 3 - 2.0,
                            clipper: DayThreeClipper(),
                            label: "DAY 3",
                            color: Color.fromARGB(255, 2, 214, 242),
                            onTap: () {
                              setState(() {
                                users = FirebaseFirestore.instance
                                    .collection('cse')
                                    .doc('events')
                                    .collection('day3');
                              });
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                  Expanded(
                    child: ListView(
                      addAutomaticKeepAlives: false,
                      cacheExtent: 300,
                      reverse: false,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                            child: ClipPath(
                              clipper: EventTileClipper(),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Row(
                                  children: [
                                    ClipPath(
                                      clipper: EventTileImageClipper(),
                                      child: SizedBox(
                                        height: 80.0,
                                        width: 80.0,
                                        child: Image.network(
                                          document['url'].toString(),
                                          fit: BoxFit.contain,
                                          filterQuality: FilterQuality.low,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6.0),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              document['eventname'].toString(),
                                              style: GoogleFonts.chakraPetch(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 11.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Text(
                                                  document['type'].toString(),
                                                  style:
                                                      GoogleFonts.chakraPetch(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30.0,
                                                          left: 25.0),
                                                  child: Text(
                                                    document['time'].toString(),
                                                    style:
                                                        GoogleFonts.chakraPetch(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 9.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
