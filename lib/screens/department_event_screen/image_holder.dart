import 'package:d23_dyuksha/screens/about_screen/about_screen.dart';
import 'package:d23_dyuksha/screens/event_screen/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/event.dart';
import '../../widgets/dyuksha_logo_mini.dart';
import 'clippers.dart';

class ImageHolder extends StatefulWidget {
  final Department department;
  final List<Event> departmentEvents;
  final void Function(int) onIndexChanged;
  const ImageHolder({
    required this.department,
    required this.departmentEvents,
    required this.onIndexChanged,
    super.key,
  });

  @override
  State<ImageHolder> createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImageHolder> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      widget.onIndexChanged(currentIndex);
    });
  }

  void _onForwardTap() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.departmentEvents.length;
    });
    widget.onIndexChanged(currentIndex);
  }

  void _onBackwardTap() {
    setState(() {
      currentIndex = (currentIndex - 1) % widget.departmentEvents.length;
    });
    widget.onIndexChanged(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          ImageHolderTop(
            height: constraints.maxHeight * 0.2,
            department: Event.getDepartmentFromEnum(widget.department),
          ),
          ImageHolderCenter(
            height: constraints.maxHeight * 0.6,
            imageURL: widget.departmentEvents[currentIndex].imageURL,
          ),
          ImageHolderBottom(
            height: constraints.maxHeight * 0.2,
            onForwardTap: _onForwardTap,
            onBackwardTap: _onBackwardTap,
            event: widget.departmentEvents[currentIndex],
          ),
        ],
      );
    });
  }
}

class ImageHolderBottom extends StatelessWidget {
  final double height;
  final VoidCallback onForwardTap;
  final VoidCallback onBackwardTap;
  final Event event;

  const ImageHolderBottom({
    required this.height,
    required this.onBackwardTap,
    required this.onForwardTap,
    required this.event,
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
              onPressed: onBackwardTap,
              icon: const Icon(
                Icons.fast_rewind_rounded,
                color: Colors.white,
                size: 32.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 12.0),
                decoration: BoxDecoration(
                  color: event.getColorOfDay(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => EventScreen(event: event))),
                  icon: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                    size: 32.0,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: onForwardTap,
              icon: const Icon(
                Icons.fast_forward_rounded,
                color: Colors.white,
                size: 32.0,
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
  final String imageURL;
  const ImageHolderCenter({
    required this.height,
    required this.imageURL,
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
                child: Image.network(imageURL,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Image.asset(
                          'assets/images/placeholder_dyuksha.jpg',
                          fit: BoxFit.cover,
                        ),
                    loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      double progress = loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!.toDouble();
                      return Container(
                        color: Colors.white.withOpacity(0.2),
                        child: Transform.scale(
                          scale: progress,
                          child: Container(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      );
                    }),
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
  final String department;

  const ImageHolderTop({
    required this.height,
    super.key,
    required this.department,
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
                onPressed: () => Navigator.of(context).pop(),
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
                department.toUpperCase(),
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12.0, top: 10),
              child: DyukshaLogoMini(),
            ),
          ],
        ),
      ),
    );
  }
}
