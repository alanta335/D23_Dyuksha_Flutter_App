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

class _TalkWithRJScreenState extends State<TalkWithRJScreen>
    with AutomaticKeepAliveClientMixin<TalkWithRJScreen> {
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

  bool _timerFree = true;

  Future<void> _send() async {
    if (_questionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter your question."),
      ));
      return;
    }
    Future.delayed(const Duration(seconds: 30), () {
      setState(() {
        _timerFree = true;
      });
    });
    await cf.FirebaseFirestore.instance.collection('RJ').doc().set({
      "Name": _nameController.text.toString(),
      "Your Question": _questionController.text.toString(),
    });
    _nameController.clear();
    _questionController.clear();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Your Question has been sent to the RJ.\nPlease wait 30 seconds more to send next message."),
      ));
    }
    setState(() {
      _timerFree = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12.0),
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
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: CyberpunkButton(
                  color: Colors.yellow,
                  label: 'Send',
                  onTap: _timerFree ? _send : () {},
                ),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
