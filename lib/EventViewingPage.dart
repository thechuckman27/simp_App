import 'package:flutter/material.dart';
import 'package:simp_app/EventProviderClass.dart';
import 'package:provider/provider.dart';
import 'package:simp_app/EventsClass.dart';
import 'package:flutter/cupertino.dart';
import 'UtilsTools.dart';

class EventViewPage extends StatelessWidget {
  final Event? event;

  const EventViewPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildViewingActions(context),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            buildDateTime(event!),
            SizedBox(height: 32),
            Text(
              event!.title,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      );

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? "All Day" : "From", event.from),
        if (!event.isAllDay) buildDate("To", event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Container(
      child: Text(
        Utils.toDate(date),
      ),
    );
  }

  List<Widget> buildViewingActions(BuildContext context) => [
        ElevatedButton.icon(
          onPressed: () {
            final provider = Provider.of<EventProvider>(context, listen: false);
            provider.deleteEvent(event!);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(onSurface: Colors.blue),
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          label: Text(
            "Delete",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ];
}
