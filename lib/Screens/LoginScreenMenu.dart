import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'GroupsMenuScreen.dart';
import 'GroupsOwnedScreen.dart';
import 'package:simp_app/Screens/CalMenuScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection("User");

    return Scaffold(
      appBar: AppBar(
        title: Text('User Menu'),
      ),
      body: Padding(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    icon: Icon(Icons.calendar_month, size: 32),
                    label: Text(
                      "Calender",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CalMenu()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    icon: Icon(Icons.group, size: 32),
                    label: Text(
                      "Group Menu",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GroupMenu()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    icon: Icon(Icons.account_balance, size: 32),
                    label: Text(
                      "Groups Owned",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupsOwnedMenu()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Signed In As",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  User!.email!,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    icon: Icon(Icons.arrow_back, size: 32),
                    label: Text(
                      "Sign Out",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () => FirebaseAuth.instance.signOut(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
