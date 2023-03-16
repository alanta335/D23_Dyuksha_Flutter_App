import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/cypberpunk_background_scaffold.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    Query users = FirebaseFirestore.instance
        .collection('cse')
        .doc('events')
        .collection('day1');
    print(users.toString());
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("asdasdasd----error-----");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        print("${snapshot.data!.docs}============");
        return CyberpunkBackgroundScaffold(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: ListView(
                addAutomaticKeepAlives: false,
                cacheExtent: 300,
                reverse: false,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  print("$document aihsjdijahsdghasd--------------");
                  return Card(
                    child: ListTile(
                      title: Text('${document.get('eventname')}'),
                      subtitle: Text('${document.get('type')}'),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
