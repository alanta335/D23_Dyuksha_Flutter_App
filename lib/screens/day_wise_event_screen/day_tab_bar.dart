import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayTabBar extends StatelessWidget {
  final double width;
  final CustomClipper<Path> clipper;
  final Color color;
  final String label;
  final VoidCallback onTap;
  const DayTabBar({
    required this.width,
    required this.clipper,
    required this.label,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipPath(
        clipper: clipper,
        child: Container(
          alignment: Alignment.center,
          width: width,
          color: color,
          child: Text(
            label,
            style: GoogleFonts.chakraPetch(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

