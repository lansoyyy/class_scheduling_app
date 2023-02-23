// import 'dart:convert';
// import 'package:calendar_view/calendar_view.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:table_calendar/table_calendar.dart';

// class DynamicEvent extends StatefulWidget {
//   @override
//   _DynamicEventState createState() => _DynamicEventState();
// }

// class _DynamicEventState extends State<DynamicEvent> {
//   late CalendarControllerProvider _controller;
//   late Map<DateTime, List<dynamic>> _events;
//   late List<dynamic> _selectedEvents;
//   late TextEditingController _eventController;
//   late SharedPreferences prefs;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarControllerProvider();
//     _eventController = TextEditingController();
//     _events = {};
//     _selectedEvents = [];
//     prefsData();
//   }

//   prefsData() async {
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _events = Map<DateTime, List<dynamic>>.from(
//           decodeMap(json.decode(prefs.getString("events") ?? "{}")));
//     });
//   }

//   Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
//     Map<String, dynamic> newMap = {};
//     map.forEach((key, value) {
//       newMap[key.toString()] = map[key];
//     });
//     return newMap;
//   }

//   Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
//     Map<DateTime, dynamic> newMap = {};
//     map.forEach((key, value) {
//       newMap[DateTime.parse(key)] = map[key];
//     });
//     return newMap;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.black,
//         title: const Text('Flutter Dynamic Event Calendar'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TableCalendar(
//               firstDay: DateTime.utc(2010, 10, 16),
//               lastDay: DateTime.utc(2030, 3, 14),
//               startingDayOfWeek: StartingDayOfWeek.monday,
//               focusedDay: DateTime.now(),
//             ),
//             ..._selectedEvents.map((event) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 20,
//                     width: MediaQuery.of(context).size.width / 2,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey)),
//                     child: Center(
//                         child: Text(
//                       event,
//                       style: const TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     )),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.black,
//         onPressed: _showAddDialog,
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   _showAddDialog() async {
//     await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               backgroundColor: Colors.white70,
//               title: const Text("Add Events"),
//               content: TextField(
//                 controller: _eventController,
//               ),
//               actions: <Widget>[
//                 MaterialButton(
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(
//                         color: Colors.red, fontWeight: FontWeight.bold),
//                   ),
//                   onPressed: () {
//                     if (_eventController.text.isEmpty) return;
//                     setState(() {
//                       if (_events[_controller.selectedDay] != null) {
//                         _events[_controller.selectedDay]!
//                             .add(_eventController.text);
//                       } else {
//                         _events[_controller.selectedDay] = [
//                           _eventController.text
//                         ];
//                       }
//                       prefs.setString(
//                           "events", json.encode(encodeMap(_events)));
//                       _eventController.clear();
//                       Navigator.pop(context);
//                     });
//                   },
//                 )
//               ],
//             ));
//   }
// }
