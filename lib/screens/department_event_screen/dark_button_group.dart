import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../models/event.dart';
import 'dark_button.dart';

class DarkButtonGroup extends StatelessWidget {
  final Event event;
  const DarkButtonGroup({
    required this.event,
    super.key,
  });

  Future<void> _registerForEvent(BuildContext context) async {
    final launched = await launchUrl(
        mode: LaunchMode.externalApplication, Uri.parse(event.registrationURL));
    if (!launched) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Please check your internet connection and try again."),
          ),
        );
      }
    }
  }

  Future<void> _share() async {
    await Share.share(
      "*****DYUKSHA'23*****\n\n${event.name}\n\nABOUT\n\n${event.about}\n\nCoordinator:${event.coordintorName}\nContact:${event.contact}\nRegistration URL:${event.registrationURL}\n",
      subject: event.name,
    );
  }

  Future<void> _download() async {
    try {
      final output = await getDownloadsDirectory();
      if (output == null) {
        return;
      }

      final pdf = pw.Document();
      final fontStyleBold = await PdfGoogleFonts.chakraPetchBold();
      final fontStyleRegular = await PdfGoogleFonts.chakraPetchRegular();
      final fontStyleSemiBold = await PdfGoogleFonts.chakraPetchSemiBold();

      final eventImage = await networkImage(event.imageURL);
      File file = File("${output.path}/dyuksha23_${event.name}.pdf");

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(20.0),
          footer: (_) => pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 12.0),
            child: pw.Text(
              "Dyuksha '23",
              style: pw.TextStyle(
                font: fontStyleBold,
                color: PdfColor.fromInt(Colors.black.value),
              ),
            ),
          ),
          build: (pw.Context context) {
            return [
              pw.Partitions(
                children: [
                  pw.Partition(
                    child: pw.Container(
                      padding: const pw.EdgeInsets.all(12.0),
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          color: PdfColor.fromInt(event.getColorOfDay().value),
                        ),
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                        verticalDirection: pw.VerticalDirection.down,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: <pw.Widget>[
                          pw.Text(
                            event.name.toUpperCase(),
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(
                              font: fontStyleBold,
                              fontSize: 42.0,
                              color:
                                  PdfColor.fromInt(event.getColorOfDay().value),
                            ),
                          ),
                          pw.SizedBox(height: 16.0),
                          pw.ClipRRect(
                            child: pw.Image(
                              eventImage,
                            ),
                            horizontalRadius: 20.0,
                            verticalRadius: 20.0,
                          ),
                          pw.SizedBox(height: 16.0),
                          pw.Text(
                            "DAY ${event.day}\t\t${event.time}",
                            style: pw.TextStyle(
                              font: fontStyleRegular,
                              fontSize: 24.0,
                              color: PdfColor.fromInt(Colors.grey.value),
                            ),
                          ),
                          pw.SizedBox(height: 80.0),
                          pw.Text(
                            "ABOUT",
                            style: pw.TextStyle(
                              font: fontStyleSemiBold,
                              fontSize: 18.0,
                              decoration: pw.TextDecoration.underline,
                              color: PdfColor.fromInt(Colors.black.value),
                            ),
                          ),
                          pw.SizedBox(height: 8.0),
                          pw.Text(
                            "\n\t${event.about}",
                            textAlign: pw.TextAlign.justify,
                            style: pw.TextStyle(
                              font: fontStyleSemiBold,
                              fontSize: 14.0,
                              color: PdfColor.fromInt(Colors.black.value),
                            ),
                          ),
                          pw.SizedBox(height: 12.0),
                          pw.Text(
                            "COORDINATOR : ${event.coordintorName}",
                            style: pw.TextStyle(
                              font: fontStyleSemiBold,
                              fontSize: 16.0,
                              color: PdfColor.fromInt(Colors.white.value),
                            ),
                          ),
                          pw.Text(
                            "CONTACT : ${event.contact}",
                            style: pw.TextStyle(
                              font: fontStyleSemiBold,
                              fontSize: 16.0,
                              color: PdfColor.fromInt(Colors.white.value),
                            ),
                          ),
                          pw.SizedBox(height: 6.0),
                          pw.UrlLink(
                            child: pw.Text(
                              "REGISTER NOW",
                              style: pw.TextStyle(
                                font: fontStyleBold,
                                decoration: pw.TextDecoration.underline,
                                fontSize: 26.0,
                                color: PdfColor.fromInt(
                                    event.getColorOfDay().value),
                              ),
                            ),
                            destination: event.registrationURL,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ];
          },
        ),
      );

      await file.writeAsBytes(await pdf.save());
    } catch (e) {}
  }

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
            DarkButton(
              iconData: Icons.file_download_outlined,
              onTap: _download,
            ),
            GestureDetector(
              onTap: () => _registerForEvent(context),
              child: Container(
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
            ),
            DarkButton(
              iconData: Icons.share,
              onTap: _share,
            ),
          ],
        ),
      ),
    );
  }
}
