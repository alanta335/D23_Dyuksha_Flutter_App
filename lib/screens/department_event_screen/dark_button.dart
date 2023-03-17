import 'package:flutter/material.dart';

class DarkButton extends StatelessWidget {
  final IconData iconData;
  final double size;
  const DarkButton({
    required this.iconData,
    this.size = 24.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Icon(
        iconData,
        color: Colors.grey,
        size: size,
      ),
    );
  }
}
