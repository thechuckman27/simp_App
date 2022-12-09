import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController groupName = TextEditingController();
  TextEditingController groupMembers = TextEditingController();
  TextEditingController groupOwner = TextEditingController();
  TextEditingController groupId = TextEditingController();
  TextEditingController groupEvents = TextEditingController();

  Future signUpGroup() async {
    if (groupName.text.isEmpty) {
      const userMess = SnackBar(content: Text("Group Name must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(userMess);
    }
    if (groupMembers.text.isEmpty) {
      const passMess =
          SnackBar(content: Text("Group Members must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(passMess);
    }
    if (groupOwner.text.isEmpty) {
      const nameMess = SnackBar(content: Text("Group Owner must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(nameMess);
    }
    if (groupId.text.isEmpty) {
      const userNameMess =
          SnackBar(content: Text("Group Id must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(userNameMess);
    }

    if (groupEvents.text.isEmpty) {
      const userNameMess =
          SnackBar(content: Text("Group Events must not be empty"));
      ScaffoldMessenger.of(context).showSnackBar(userNameMess);
    }

    Future<void> addGroupDetails(String gName, String gMembers, String gOwner,
        String gId, String gEvents) async {
      await FirebaseFirestore.instance.collection("groups").add({
        "Group Name": gName,
        "Group Members": gMembers,
        "Group Owner": gOwner,
        "Group Id": gId,
        "Group Events": gEvents,
      });
    }

    addGroupDetails(groupName.text.trim(), groupMembers.text.trim(),
        groupOwner.text.trim(), groupId.text.trim(), groupEvents.text.trim());

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Group Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: groupName,
                decoration: InputDecoration(hintText: 'New Group Name'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: groupMembers,
                decoration: InputDecoration(hintText: 'New Group Member'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: groupOwner,
                decoration: InputDecoration(hintText: 'New Group Owner'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: groupId,
                decoration: InputDecoration(hintText: "New Group Id"),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: groupEvents,
                decoration: InputDecoration(hintText: "New Group Event"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.arrow_forward, size: 32),
                label: Text(
                  "Create New Group",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signUpGroup,
              )
            ],
          ),
        ),
      ),
    );
  }
}
