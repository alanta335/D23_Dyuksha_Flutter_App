import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import '/widgets/dyuksha_logo_mini.dart';
import 'about_dyuksha_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const String aboutDyukshaContent="Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ";

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SafeArea(child: DyukshaLogoMini()),
            const SizedBox(height: 16.0),
            const AboutDyukshaTitle(),
            const SizedBox(height: 30.0),
            Text(
              aboutDyukshaContent.toUpperCase(),
              style: GoogleFonts.chakraPetch(
                 color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

