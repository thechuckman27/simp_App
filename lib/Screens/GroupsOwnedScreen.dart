import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupsOwnedMenu extends StatefulWidget {
  const GroupsOwnedMenu({Key? key}) : super(key: key);

  @override
  State<GroupsOwnedMenu> createState() => _GroupsOwnedState();
}

class _GroupsOwnedState extends State<GroupsOwnedMenu> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Groups Owned'),
        ),
        body: null);
  }
}
