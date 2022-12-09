import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future signUp() async {
    if (emailController.text.isEmpty) {
      const userMess = SnackBar(content: Text("Email must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(userMess);
    }
    if (passwordController.text.isEmpty) {
      const passMess = SnackBar(content: Text("Password must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(passMess);
    }
    if (nameController.text.isEmpty) {
      const nameMess = SnackBar(content: Text("Name must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(nameMess);
    }
    if (userNameController.text.isEmpty) {
      const userNameMess =
          SnackBar(content: Text("User name must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(userNameMess);
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      addUserDetails(
          emailController.text.trim(),
          passwordController.text.trim(),
          nameController.text.trim(),
          userNameController.text.trim());

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  Future<void> addUserDetails(
      String email, String password, String name, String userName) async {
    await FirebaseFirestore.instance.collection("user").add({
      "Email": email,
      "Password": password,
      "Name": name,
      "User Name": userName
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'User Email, include the @(provider).com'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(hintText: 'Create User Name'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Create User Password'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Create User Name"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.arrow_forward, size: 32),
                label: Text(
                  "Create New User",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signUp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
