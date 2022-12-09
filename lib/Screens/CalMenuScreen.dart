import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simp_app/EventProviderClass.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:simp_app/event_data_source.dart';
import 'EventEditingScreen.dart';
import 'dart:core';
import 'package:simp_app/TasksWidget.dart';

class CalMenu extends StatelessWidget {
  const CalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Calendar"),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: EventDataSource(events),
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.setDate(details.date!);

          showModalBottomSheet(
            context: context,
            builder: (context) => TasksWidget(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        //backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EventEditingPage()),
        ),
      ),
    );
  }
}
