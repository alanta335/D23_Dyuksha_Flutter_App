import '../../widgets/cyberpunk_button.dart';
import '../../widgets/cypberpunk_background_scaffold.dart';
import '/widgets/dyuksha_logo_mini.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart' as cf;

import 'cyberpunk_textfield.dart';

class TalkWithRJScreen extends StatefulWidget {
  const TalkWithRJScreen({super.key});

  @override
  State<TalkWithRJScreen> createState() => _TalkWithRJScreenState();
}

class _TalkWithRJScreenState extends State<TalkWithRJScreen> {
  late TextEditingController _nameController;
  late TextEditingController _questionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _questionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _questionController.dispose();
    super.dispose();
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TALK WITH RJ',
                  style: GoogleFonts.chakraPetch(
                    color: Colors.yellow,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(
                  color: Colors.yellow,
                  height: 2,
                  thickness: 2,
                  endIndent: 160.0,
                  indent: 10.0,
                ),
                const SizedBox(height: 36.0),
                CyberpunkTextField(
                  label: 'NAME (OPTIONAL)',
                  controller: _nameController,
                ),
                const SizedBox(height: 16.0),
                CyberpunkTextField(
                  controller: _questionController,
                  label: 'YOUR QUESTION ?',
                  maxLines: 8,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: CyberpunkButton(
                color: Color.fromARGB(255, 251, 255, 6),
                label: 'Send',
                onTap: () {
                  cf.FirebaseFirestore.instance.collection('RJ').doc().set({
                    "Name": _nameController.text.toString(),
                    "Your Question": _questionController.text.toString(),
                  });
                  _nameController.text = "";
                  _questionController.text = "";
                  Fluttertoast.showToast(
                    msg: "Send successful",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.yellowAccent,
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
