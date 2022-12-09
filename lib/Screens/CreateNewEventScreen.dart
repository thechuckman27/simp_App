import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../EventsClass.dart';
import '../UtilsTools.dart';

class CreateNewEvent extends StatefulWidget {
  final Event? event;

  const CreateNewEvent({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  State<CreateNewEvent> createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text("My Calendar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTitle(),
              SizedBox(height: 15),
              buildDateTimePicker(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save, color: Colors.white),
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CreateNewEvent()),
        ),
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "no",
        ),
        onFieldSubmitted: (_) {},
        validator: (title) =>
            title != null && title.isEmpty ? "Title Can Not Be Empty" : null,
        controller: titleController,
      );

  Widget buildDateTimePicker() => Column(
        children: [
          buildFrom(),
        ],
      );

  Widget buildFrom() => Row(
        children: [
          Text("FROM"),
          Expanded(
            flex: 2,
            child: buildDropDownField(
              text: Utils.toDate(fromDate),
              onClicked: () {},
            ),
          ),
          Expanded(
            child: buildDropDownField(
              text: Utils.toTime(fromDate),
              onClicked: () {},
            ),
          )
        ],
      );

  Widget buildTo() => Row(
        children: [
          Text("TO"),
          Expanded(
            flex: 2,
            child: buildDropDownField(
              text: Utils.toDate(toDate),
              onClicked: () {},
            ),
          ),
          Expanded(
            child: buildDropDownField(
              text: Utils.toTime(toDate),
              onClicked: () {},
            ),
          )
        ],
      );

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );
}
