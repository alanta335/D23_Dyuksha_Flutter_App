import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayTabBar extends StatelessWidget {
  final double width;
  final CustomClipper<Path> clipper;
  final Color color;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const DayTabBar({
    required this.width,
    required this.clipper,
    required this.label,
    required this.color,
    required this.onTap,
    required this.isSelected,
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
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              fontSize: isSelected ? 16.0 : 12.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
