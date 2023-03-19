import 'package:flutter/material.dart';

import '../constants.dart';

class DyukshaLogoMini extends StatelessWidget {
  const DyukshaLogoMini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonClickCount++;
        if (buttonClickCount == buttonClickLimit) {
          confettiControllerLeft.play();
          confettiControllerRight.play();
          buttonClickCount = 0;
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/images/d23_logo_mini.png',
                height: 30,
                width: 30,
                isAntiAlias: true,
                alignment: Alignment.centerRight,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
