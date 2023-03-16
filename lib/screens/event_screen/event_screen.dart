import '../../widgets/cypberpunk_background_scaffold.dart';
import '../../widgets/dyuksha_logo_mini.dart';
import '/widgets/cyberpunk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/event.dart';
import 'about_box.dart';

class EventScreen extends StatelessWidget {
  final Event event;
  const EventScreen({
    required this.event,
    super.key,
  });

  Future<void> _onRegisterButtonTapped(BuildContext context) async {
    bool result = false;
    try {
      result = await launchUrl(Uri.parse(event.registrationURL));
    } on PlatformException catch (e) {
      print(e.toString());//Log
      MotionToast.error(
              description: const Text(
                  "Unable to open the website.\nCheck your internet connection and try again."))
          .show(context);
    }
    if (!result && context.mounted) {
      print("Something went wrong");//Log
      MotionToast.error(
              description: const Text(
                  "Unable to open the website.\nCheck your internet connection and try again."))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
        child: Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SafeArea(child: DyukshaLogoMini()),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.getCategoryValue().toUpperCase(),
                style: GoogleFonts.chakraPetch(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                event.name.toUpperCase(),
                style: GoogleFonts.chakraPetch(
                  color: event.getColorOfDay(),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: MediaQuery.of(context).size.width - 60.0,
                width: MediaQuery.of(context).size.width - 60.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.asset(
                    event.imageURL,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          CyberpunkButton(
           color: event.getColorOfDay(),
           label: "REGISTER",
            onTap: () => _onRegisterButtonTapped(context),
          ),
          const SizedBox(height: 20.0),
          AboutBox(event: event),
        ],
      ),
    ));
  }
}



