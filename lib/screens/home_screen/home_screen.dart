import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import '/data/dummy_events.dart';
import '../../widgets/cyberpunk_button.dart';
import '../department_event_screen/department_event_screen.dart';
import '../event_screen/event_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Transform.scale(
          scale: 0.55,
          child: Image.asset(
            "assets/images/d23_logo_text.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 320,
            child: CarouselSlider.builder(
              itemCount: events.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.width * 0.75,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  viewportFraction: 0.75),
              itemBuilder: (context, index, realIndex) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => EventScreen(event: events[index])));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      events[index].imageURL,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CyberpunkButton(
            color: Colors.red,
            label: 'BOOK NOW',
            onTap: () {},
          ),
          Text(
            'Department',
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 220.0,
            child: CarouselSlider.builder(
              itemCount: events.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.5,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                viewportFraction: 0.5,
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const DepartmentEventScreen(),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Image.asset(
                      events[itemIndex].imageURL,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 60.0),
        ]),
      ),
    );
  }
}
