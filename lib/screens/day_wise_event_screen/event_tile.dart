import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/event.dart';
import 'clippers.dart';

class EventTile extends StatelessWidget {
  final Event event;
  const EventTile({
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        launchUrl(
            mode: LaunchMode.externalApplication,
            Uri.parse(event.registrationURL))
      },
      child: ClipPath(
        clipper: EventTileClipper(),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
          ),
          child: Row(
            children: [
              ClipPath(
                clipper: EventTileImageClipper(),
                child: SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Image.network(
                    event.imageURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        double progress =
                            loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!.toDouble();
                        return Transform.scale(
                          scale: progress,
                          child: Container(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        );
                      }
                    },
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/images/placeholder_dyuksha.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.chakraPetch(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              event.getCategoryValue(),
                              textAlign: TextAlign.right,
                              style: GoogleFonts.chakraPetch(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 24.0, top: 36.0),
                            child: Text(
                              event.time.toUpperCase(),
                              style: GoogleFonts.chakraPetch(
                                fontWeight: FontWeight.w400,
                                fontSize: 9.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
