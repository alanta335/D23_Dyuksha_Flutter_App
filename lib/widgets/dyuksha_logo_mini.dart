import 'package:flutter/material.dart';

class DyukshaLogoMini extends StatelessWidget {
  const DyukshaLogoMini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
