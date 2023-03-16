import 'package:flutter/material.dart';

class DyukshaLogoMini extends StatelessWidget {
  const DyukshaLogoMini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        width: 30,
        child: Image.asset(
          'assets/images/d23_logo_mini.png',
          color: Colors.white,
          alignment: Alignment.centerRight,
        ));
  }
}