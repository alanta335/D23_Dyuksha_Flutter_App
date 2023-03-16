import 'dart:ui';

import 'package:flutter/material.dart';

class CyberpunkBackgroundScaffold extends StatelessWidget {
  final Widget child;

  const CyberpunkBackgroundScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cyber_city.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Scaffold(
              backgroundColor: const Color(0x66010101),
              //backgroundColor: Colors.white,

              body: child,
            ),
          ),
        ),
      ),
    );
  }
}
