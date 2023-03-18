import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d23_dyuksha/models/event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/dyuksha_logo_mini.dart';
import 'clippers.dart';
import 'dark_button.dart';

int index = 0;
int maxindex = 0;
var data;

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    super.key,
    required this.dep,
  });
  final Department dep;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          ImageHolderTop(height: constraints.maxHeight * 0.11, dep: dep),
          ImageHolderCenter(height: constraints.maxHeight),
        ],
      );
    });
  }
}

class ImageHolderBottom extends StatefulWidget {
  final double height;
  const ImageHolderBottom({
    required this.height,
    super.key,
  });

  @override
  State<ImageHolderBottom> createState() => _ImageHolderBottomState();
}

class _ImageHolderBottomState extends State<ImageHolderBottom> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageHolderBottomClipper(slope: 24.0, gap: 12.0),
      child: Container(
        height: widget.height,
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  index = index - 1;
                });
              },
              icon: const Icon(
                Icons.fast_rewind_rounded,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.black,
                size: 32.0,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  index = index + 1;
                });
              },
              icon: const Icon(
                Icons.fast_forward_rounded,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageHolderCenter extends StatefulWidget {
  final double height;
  const ImageHolderCenter({
    required this.height,
    super.key,
  });

  @override
  State<ImageHolderCenter> createState() => _ImageHolderCenterState();
}

class EventList {
  String? cntname;
  String? ticket;
  String? contact;
  String? description;
  String? time;
  String? type;
  String? url;
  String? eventname;

  EventList(
      {this.cntname,
      this.ticket,
      this.contact,
      this.description,
      this.time,
      this.type,
      this.url,
      this.eventname});
  EventList.fromJson(Map<String, dynamic> json) {
    cntname = json['cntname'];
    ticket = json['ticket'];
    contact = json['contact'];
    description = json['description'];
    time = json['time'];
    type = json['type'];
    url = json['url'];
    eventname = json['eventname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cntname'] = cntname;
    data['ticket'] = ticket;
    data['contact'] = contact;
    data['description'] = description;
    data['time'] = time;
    data['type'] = type;
    data['url'] = url;
    data['eventname'] = eventname;
    return data;
  }
}

class _ImageHolderCenterState extends State<ImageHolderCenter> {
  @override
  Widget build(BuildContext context) {
    CollectionReference eventlist = FirebaseFirestore.instance
        .collection('cse')
        .doc("events")
        .collection("day1");

    Future<List<dynamic>> getData() async {
      QuerySnapshot querySnapshot = await eventlist.get();

      List<dynamic> allData = querySnapshot.docs
          .map((doc) => EventList(
                eventname: doc.get("eventname"),
                url: doc.get("url"),
                ticket: doc.get("ticket"),
              ))
          .toList();
      setState(() {
        maxindex = allData.length;
        data = allData;
      });
      return allData;
    }

    getData();
    return Column(
      children: [
        ClipPath(
          clipper: ImageHolderCenterClipper(gap: 12.0),
          child: Container(
            height: widget.height * 0.65,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: widget.height * 0.55,
                    width: widget.height * 0.55,
                    child: FutureBuilder(
                      future: getData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return Image.network(
                            snapshot.data[index].url,
                            fit: BoxFit.cover,
                          );
                        } else if (snapshot.hasError) {
                          return const Text("Error");
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ImageHolderBottomClipper(slope: 24.0, gap: 12.0),
          child: Container(
            height: widget.height * 0.11,
            color: Colors.black.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (index != 0) {
                        index = index - 1;
                      } else {
                        index = maxindex - 1;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.fast_rewind_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                      size: 32.0,
                    ),
                    onPressed: () async {
                      Uri url = Uri.parse(data[index].ticket);
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (index < maxindex - 1) {
                        index = index + 1;
                      } else {
                        index = 0;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.fast_forward_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 24.0,
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DarkButton(
              iconData: Icons.file_download_outlined,
            ),
            GestureDetector(
              onTap: () async {
                Uri url = Uri.parse(data[index].ticket);
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 28.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  'REGISTER',
                  style: GoogleFonts.chakraPetch(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const DarkButton(
              iconData: Icons.share,
            ),
          ],
        )
      ],
    );
  }
}

class ImageHolderTop extends StatefulWidget {
  final double height;
  final Department dep;
  const ImageHolderTop({
    required this.height,
    super.key,
    required this.dep,
  });

  @override
  State<ImageHolderTop> createState() => _ImageHolderTopState();
}

class _ImageHolderTopState extends State<ImageHolderTop> {
  @override
  Widget build(BuildContext context) {
    String deps = "";
    setState(() {
      if (widget.dep == Department.cse) {
        deps = "CSE";
      } else if (widget.dep == Department.mech) {
        deps = "MECH";
      } else if (widget.dep == Department.eee) {
        deps = "EEE";
      } else if (widget.dep == Department.ec) {
        deps = "ECE";
      } else if (widget.dep == Department.ice) {
        deps = "ICE";
      } else if (widget.dep == Department.civil) {
        deps = "CIVIL";
      }
    });
    return ClipPath(
      clipper: ImageHolderTopClipper(slope: 24.0, gap: 12.0),
      child: Container(
        height: widget.height,
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                deps.toString(),
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 32.0),
              child: DyukshaLogoMini(),
            ),
          ],
        ),
      ),
    );
  }
}
