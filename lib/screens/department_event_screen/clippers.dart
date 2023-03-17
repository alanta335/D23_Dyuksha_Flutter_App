import 'package:flutter/material.dart';

class ImageHolderTopClipper extends CustomClipper<Path> {
  final double slope;
  final double gap;

  ImageHolderTopClipper({
    required this.slope,
    required this.gap,
  });
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(slope, 0.0)
      ..lineTo(size.width - slope, 0.0)
      ..lineTo(size.width, slope)
      ..lineTo(size.width, size.height - gap)
      ..lineTo(size.width * 3 / 4, size.height - gap)
      ..lineTo(size.width * 3 / 4 - gap, size.height)
      ..lineTo(size.width / 4 + gap, size.height)
      ..lineTo(size.width / 4, size.height - gap)
      ..lineTo(0.0, size.height - gap)
      ..lineTo(0.0, slope)
      ..close();
  }

  @override
  bool shouldReclip(ImageHolderTopClipper oldClipper) {
    return slope != oldClipper.slope || gap != oldClipper.gap;
  }
}

class ImageHolderCenterClipper extends CustomClipper<Path> {
  final double gap;

  ImageHolderCenterClipper({required this.gap});

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width / 4, 0.0)
      ..lineTo(size.width / 4 + gap, gap)
      ..lineTo(size.width * 3 / 4 - gap, gap)
      ..lineTo(size.width * 3 / 4, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height - gap)
      ..lineTo(size.width * 3 / 4, size.height - gap)
      ..lineTo(size.width * 3 / 4 - gap, size.height)
      ..lineTo(size.width / 4 + gap, size.height)
      ..lineTo(size.width / 4, size.height - gap)
      ..lineTo(0.0, size.height - gap)
      ..close();
  }

  @override
  bool shouldReclip(ImageHolderCenterClipper oldClipper) {
    return gap != oldClipper.gap;
  }
}

class ImageHolderBottomClipper extends CustomClipper<Path> {
  final double slope;
  final double gap;

  ImageHolderBottomClipper({
    required this.slope,
    required this.gap,
  });
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width / 4, 0.0)
      ..lineTo(size.width / 4 + gap, gap)
      ..lineTo(size.width * 3 / 4 - gap, gap)
      ..lineTo(size.width * 3 / 4, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height - slope)
      ..lineTo(size.width - slope, size.height)
      ..lineTo(slope, size.height)
      ..lineTo(0.0, size.height - slope)
      ..close();
  }

  @override
  bool shouldReclip(ImageHolderBottomClipper oldClipper) {
    return slope != oldClipper.slope || gap != oldClipper.gap;
  }
}
