import 'package:flutter/material.dart';

class AboutClipper extends CustomClipper<Path> {
  final int clipDistance;
  AboutClipper({required this.clipDistance});
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(clipDistance.toDouble(), 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, clipDistance.toDouble())
      ..close();

    return path;
  }

  @override
  bool shouldReclip(AboutClipper oldClipper) {
    return oldClipper.clipDistance != clipDistance;
  }
}
