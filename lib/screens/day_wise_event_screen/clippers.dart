import 'package:flutter/material.dart';

class EventTileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width - 24.0, 0)
      ..lineTo(size.width, 24.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class EventTileImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height / 4)
      ..lineTo(size.width - 6.0, size.height / 4 + 6.0)
      ..lineTo(size.width - 6.0, size.height * 3 / 4 - 6.0)
      ..lineTo(size.width, size.height * 3 / 4)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(EventTileImageClipper oldClipper) {
    return true;
  }
}

class DayOneTabBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(12.0, 0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height / 4)
      ..lineTo(size.width - 3.0, size.height / 4 + 3.0)
      ..lineTo(size.width - 3.0, size.height * 3 / 4 - 3.0)
      ..lineTo(size.width, size.height * 3 / 4)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, 12.0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DayTwoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(4.0, 0.0)
      ..lineTo(size.width - 4.0, 0.0)
      ..lineTo(size.width - 4.0, size.height / 4)
      ..lineTo(size.width, size.height / 4 + 3.0)
      ..lineTo(size.width, size.height * 3 / 4 - 3.0)
      ..lineTo(size.width - 4.0, size.height * 3 / 4)
      ..lineTo(size.width - 4.0, size.height)
      ..lineTo(4.0, size.height)
      ..lineTo(4.0, size.height * 3 / 4)
      ..lineTo(0.0, size.height * 3 / 4 - 3.0)
      ..lineTo(0.0, size.height / 4 + 3.0)
      ..lineTo(4.0, size.height / 4)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DayThreeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width - 12.0, 0.0)
      ..lineTo(size.width, 12.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, size.height * 3 / 4)
      ..lineTo(4.0, size.height * 3 / 4 - 3.0)
      ..lineTo(4.0, size.height / 4 + 3.0)
      ..lineTo(0.0, size.height / 4)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
