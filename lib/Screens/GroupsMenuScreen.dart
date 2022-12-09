import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'CreateGroupScreen.dart';
import 'package:simp_app/main.dart';

final userRef = FirebaseFirestore.instance.collection("groups");

class GroupMenu extends StatefulWidget {
  const GroupMenu({Key? key}) : super(key: key);

  @override
  State<GroupMenu> createState() => _GroupMenuState();
}

class _GroupMenuState extends State<GroupMenu> {
  @override
  Widget build(BuildContext context) {
    List<String> docIds = [];

    Future getDocId() async {
      await FirebaseFirestore.instance.collection("groups").get().then(
            (snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }),
          );
    }

    {
      getDocId();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Group Menu"),
      ),
      body: new ListView.builder(
          itemCount: docIds.length,
          itemBuilder: (BuildContext context, int index) {
            return new Text(docIds[index]);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGroup()),
          );
        },
      ),
    );
  }
}
