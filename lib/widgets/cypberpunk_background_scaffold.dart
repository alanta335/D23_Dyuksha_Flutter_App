import 'dart:ui';
import 'package:flutter/material.dart';

class CyberpunkBackgroundScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final String bgImage;
  final bool blur;
  const CyberpunkBackgroundScaffold({
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.bgImage = 'assets/images/cyber_city.jpg',
    this.blur = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: (blur)
              ? SizedBox(
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
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
