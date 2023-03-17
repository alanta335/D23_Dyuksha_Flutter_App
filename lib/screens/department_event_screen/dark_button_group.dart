import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dark_button.dart';

class DarkButtonGroup extends StatelessWidget {
  const DarkButtonGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.5, -0.7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DarkButton(
              iconData: Icons.file_download_outlined,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 28.0,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Text(
                'REGISTER',
                style: GoogleFonts.chakraPetch(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const DarkButton(
              iconData: Icons.share,
            ),
          ],
        ),
      ),
    );
  }
}
