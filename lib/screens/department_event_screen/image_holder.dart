import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/dyuksha_logo_mini.dart';
import 'clippers.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          ImageHolderTop(height: constraints.maxHeight * 0.2),
          ImageHolderCenter(height: constraints.maxHeight * 0.6),
          ImageHolderBottom(height: constraints.maxHeight * 0.2),
        ],
      );
    });
  }
}

class ImageHolderBottom extends StatelessWidget {
  final double height;
  const ImageHolderBottom({
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageHolderBottomClipper(slope: 24.0, gap: 12.0),
      child: Container(
        height: height,
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.fast_rewind_rounded,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.black,
                size: 32.0,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.fast_forward_rounded,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageHolderCenter extends StatelessWidget {
  final double height;
  const ImageHolderCenter({
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageHolderCenterClipper(gap: 12.0),
      child: Container(
        height: height,
        width: double.infinity,
        color: Colors.black.withOpacity(0.5),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height,
                width: height,
                child: Image.asset(
                  'assets/images/proshow1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageHolderTop extends StatelessWidget {
  final double height;
  const ImageHolderTop({
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageHolderTopClipper(slope: 24.0, gap: 12.0),
      child: Container(
        height: height,
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "ECE",
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 32.0),
              child: DyukshaLogoMini(),
            ),
          ],
        ),
      ),
    );
  }
}
