import '../../widgets/cypberpunk_background_scaffold.dart';
import '/widgets/dyuksha_logo_mini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'about_dyuksha_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const String aboutDyukshaContent =
      "\tPalakkad has increasingly fantastic things tucked away among its fold of the Western Ghats other than the Silent Valley National Park, and among those things is the NSS College of Engineering. It is best described as a place that is bordered by verdurous mountains, rather than walls, where youngsters from all over the state work and live together as a vibrant community. As opposed to portraying it as a scholarly organization, it is best depicted by the name its students gave - Shangri La, Heaven on Earth.\n\n\t Dyuksha'23 is a remarkable vision, propelled by an incredible reason and brought about by a vital spark that makes one's contemplations break bonds, to sustain a place where nothing and literally nothing is unimaginable. The national-level techno-administrative, the social symposium is an amalgamation of science and artistry. It is innovation and technology acting together, catalyzed by inventiveness, to make the panacea. The intention of Dyuksha'23 is to compose a definitive outlay of innovation, business, culture, and flair.";

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      bgImage: 'assets/images/cyber_city.jpg',
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12.0),
              const DyukshaLogoMini(),
              SizedBox(height: 22.0),
              const AboutDyukshaTitle(),
              const SizedBox(height: 30.0),
              Text(
                aboutDyukshaContent,
                textAlign: TextAlign.justify,
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                "CONTACT",
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18.0),
              Text(
                "ASWIN  7356508546\nJAGAN  9539467296",
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
