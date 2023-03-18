import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/event.dart';
import 'about_clipper.dart';

class AboutBox extends StatelessWidget {
  const AboutBox({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AboutClipper(clipDistance: 16),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: event.getColorOfDay(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 2)),
              ),
              child: Text(
                (event.about == "") ? "CONTACT" : "ABOUT",
                textAlign: TextAlign.start,
                style: GoogleFonts.chakraPetch(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (!(event.about == "")) const SizedBox(height: 12.0),
            if (!(event.about == ""))
              Text(
                event.about.toUpperCase(),
                style: GoogleFonts.chakraPetch(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ),
              ),
            const SizedBox(height: 24.0),
            Text(
              "COORDINATOR: " + event.coordintorName.toUpperCase(),
              style: GoogleFonts.chakraPetch(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              "CONTACT: " + event.contact.toUpperCase(),
              style: GoogleFonts.chakraPetch(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
