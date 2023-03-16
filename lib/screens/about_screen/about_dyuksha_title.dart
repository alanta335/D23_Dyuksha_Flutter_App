import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutDyukshaTitle extends StatelessWidget {
  const AboutDyukshaTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT',
          style: GoogleFonts.chakraPetch(
            color: Colors.cyan,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.only(bottom: 4),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.cyan,
              ),
            ),
          ),
          child: Text(
            "DYUKSHA'23",
            style: GoogleFonts.chakraPetch(
              color: Colors.cyan,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
