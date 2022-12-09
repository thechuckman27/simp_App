import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simp_app/Screens/CreateUserMenu.dart';
import 'package:simp_app/Screens/LostPasswordMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userIdController = TextEditingController();
  final userPasswordController = TextEditingController();

  @override
  void dispose() {
    userIdController.dispose();
    userPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      if (userIdController.text.isEmpty) {
        const userMess = SnackBar(content: Text("Email must not be empty"));
        ScaffoldMessenger.of(context).showSnackBar(userMess);
      }
      if (userPasswordController.text.isEmpty) {
        const passMess = SnackBar(content: Text("Password must not be empty"));
        ScaffoldMessenger.of(context).showSnackBar(passMess);
      }
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userIdController.text.trim(),
          password: userPasswordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/MenuPagePic.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('SIMP'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                TextField(
                  controller: userIdController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'User Id'),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: userPasswordController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'User Password'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ElevatedButton(
                          onPressed: signIn, child: const Text('Login')),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: const Text('Create User')),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LostPasswordScreen()),
                            );
                          },
                          child: const Text('Lost Password?')),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
