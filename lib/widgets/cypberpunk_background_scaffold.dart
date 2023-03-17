import 'dart:ui';
import 'package:flutter/material.dart';

class CyberpunkBackgroundScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;

  const CyberpunkBackgroundScaffold({
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    super.key,
  });

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
              appBar: appBar,
              backgroundColor: const Color(0x66010101),
              //backgroundColor: Colors.red,
              body: child,
              bottomNavigationBar: bottomNavigationBar,
            ),
          ),
        ),
      ),
    );
  }
}
