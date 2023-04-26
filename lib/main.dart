import 'package:calendar_view/calendar_view.dart';
import 'package:class_scheduling_app/screens/calendar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: const MaterialApp(
        home: CalendarScreen(),
      ),
    );
  }
}
