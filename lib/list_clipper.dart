import 'package:flutter/material.dart';

class ListClipper extends CustomClipper<Path> {
  final int clipDistance;
  ListClipper({required this.clipDistance});
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
  bool shouldReclip(ListClipper oldClipper) {
    return oldClipper.clipDistance != clipDistance;
  }
}
