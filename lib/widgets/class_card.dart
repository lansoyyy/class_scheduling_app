// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:class_scheduling_app/screens/home_screen.dart';
// import 'package:class_scheduling_app/utils/colors.dart';
// import 'package:class_scheduling_app/widgets/text_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:localstore/localstore.dart';

// class ClassCard extends StatefulWidget {
//   var label;

//   ClassCard({required this.label});

//   @override
//   State<ClassCard> createState() => _ClassCardState();
// }

// class _ClassCardState extends State<ClassCard> {
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   late String className = '';

//   late String room = '';

//   late String from = '';

//   late String to = '';

//   final db = Localstore.instance;

//   List<String> rooms = [];
//   List<String> classNames = [];
//   List<String> froms = [];
//   List<String> tos = [];
//   List<String> ids = [];

//   var hasLoaded = false;

//   getData() async {
//     final items = await db.collection(widget.label).get();

//     if (items != null) {
//       List<dynamic> values1 = items.values.toList();

//       values1.sort((a, b) => a['from'].compareTo(b['from']));

//       for (var element in values1) {
//         rooms.add(element['room']);
//         classNames.add(element['className']);
//         froms.add(element['from']);
//         tos.add(element['to']);
//         ids.add(element['id']);
//       }
//     }
//     print(items);

//     setState(() {
//       hasLoaded = true;
//     });
//   }

//   void _setupAlarm(hour, minute, int day) {
//     try {
//       final now = DateTime.now();
//       final monday = now.add(Duration(days: (day - now.weekday) % 7));
//       final startTime =
//           DateTime(monday.year, monday.month, monday.day, hour, minute, 0);
//       const interval = Duration(days: 7);

//       AndroidAlarmManager.periodic(
//         interval,
//         minute, // ID of the alarm
//         _onAlarmFired,
//         startAt: startTime,
//         exact: true,
//         wakeup: true,
//       );

//       print('Alarm set for ${startTime.toString()}');
//     } catch (e) {
//       print('${e}asd');
//     }
//   }

//   Future<void> _onAlarmFired() async {
//     // Your code here
//     print('hi');
//   }

//   late int hour;
//   late int minute;

//   @override
//   Widget build(BuildContext context) {
//     return hasLoaded
//         ? SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 elevation: 3,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: brownAccet,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   width: double.infinity,
//                   height: 250,
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 50,
//                         color: primary,
//                         width: double.infinity,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextRegular(
//                                   text: widget.label,
//                                   fontSize: 28,
//                                   color: Colors.black),
//                               IconButton(
//                                   onPressed: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return StatefulBuilder(
//                                               builder: ((context, setState) {
//                                             return Dialog(
//                                               child: Container(
//                                                 height: 420,
//                                                 decoration: BoxDecoration(
//                                                   color: primary,
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                 ),
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 15, right: 15),
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       const SizedBox(
//                                                         height: 20,
//                                                       ),
//                                                       TextBold(
//                                                           text:
//                                                               'Adding Schedule - ${widget.label}',
//                                                           fontSize: 18,
//                                                           color: Colors.black),
//                                                       const SizedBox(
//                                                         height: 20,
//                                                       ),
//                                                       TextRegular(
//                                                           text:
//                                                               'Class name/code:',
//                                                           fontSize: 12,
//                                                           color: Colors.black),
//                                                       SizedBox(
//                                                         height: 35,
//                                                         child: TextFormField(
//                                                           onChanged: ((value) {
//                                                             className = value;
//                                                           }),
//                                                           decoration:
//                                                               const InputDecoration(
//                                                                   enabledBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide: BorderSide(
//                                                                         width:
//                                                                             1,
//                                                                         color: Colors
//                                                                             .black), //<-- SEE HERE
//                                                                   ),
//                                                                   filled: true,
//                                                                   fillColor:
//                                                                       Colors
//                                                                           .white),
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 10),
//                                                       TextRegular(
//                                                           text: 'Room:',
//                                                           fontSize: 12,
//                                                           color: Colors.black),
//                                                       SizedBox(
//                                                         height: 35,
//                                                         child: TextFormField(
//                                                           onChanged: ((value) {
//                                                             room = value;
//                                                           }),
//                                                           decoration:
//                                                               const InputDecoration(
//                                                                   enabledBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide: BorderSide(
//                                                                         width:
//                                                                             1,
//                                                                         color: Colors
//                                                                             .black), //<-- SEE HERE
//                                                                   ),
//                                                                   filled: true,
//                                                                   fillColor:
//                                                                       Colors
//                                                                           .white),
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 10),
//                                                       TextRegular(
//                                                           text: 'Schedule:',
//                                                           fontSize: 12,
//                                                           color: Colors.black),
//                                                       Center(
//                                                         child: SizedBox(
//                                                           height: 50,
//                                                           width: 200,
//                                                           child:
//                                                               CupertinoDatePicker(
//                                                             mode:
//                                                                 CupertinoDatePickerMode
//                                                                     .time,
//                                                             initialDateTime:
//                                                                 DateTime.now(),
//                                                             onDateTimeChanged:
//                                                                 (DateTime
//                                                                     newDateTime) {
//                                                               setState(() {
//                                                                 from =
//                                                                     "${newDateTime.hour}:${newDateTime.minute}";

//                                                                 hour =
//                                                                     newDateTime
//                                                                         .hour;
//                                                                 minute =
//                                                                     newDateTime
//                                                                         .minute;
//                                                               });

//                                                               print(from);

//                                                               // Handle the change
//                                                             },
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Center(
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   top: 10,
//                                                                   bottom: 10),
//                                                           child: TextRegular(
//                                                               text: 'to',
//                                                               fontSize: 12,
//                                                               color:
//                                                                   Colors.black),
//                                                         ),
//                                                       ),
//                                                       Center(
//                                                         child: SizedBox(
//                                                           height: 50,
//                                                           width: 200,
//                                                           child:
//                                                               CupertinoDatePicker(
//                                                             mode:
//                                                                 CupertinoDatePickerMode
//                                                                     .time,
//                                                             initialDateTime:
//                                                                 DateTime.now(),
//                                                             onDateTimeChanged:
//                                                                 (DateTime
//                                                                     newDateTime) {
//                                                               setState(() {
//                                                                 to =
//                                                                     "${newDateTime.hour}:${newDateTime.minute}:${newDateTime.second}";
//                                                               });
//                                                               // Handle the change
//                                                             },
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                           height: 30),
//                                                       Center(
//                                                         child: MaterialButton(
//                                                             shape:
//                                                                 RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5),
//                                                             ),
//                                                             color: greenAccet,
//                                                             minWidth: 150,
//                                                             height: 40,
//                                                             child: TextRegular(
//                                                                 text: 'Done',
//                                                                 fontSize: 14,
//                                                                 color: Colors
//                                                                     .white),
//                                                             onPressed: () {
//                                                               print(hour);
//                                                               print(minute);
//                                                               print(
//                                                                   widget.label);
//                                                               final id = db
//                                                                   .collection(
//                                                                       widget
//                                                                           .label)
//                                                                   .doc()
//                                                                   .id;
//                                                               db
//                                                                   .collection(
//                                                                       widget
//                                                                           .label)
//                                                                   .doc(id)
//                                                                   .set({
//                                                                 'className':
//                                                                     className,
//                                                                 'room': room,
//                                                                 'from': from,
//                                                                 'to': to,
//                                                                 'id': id
//                                                               });

//                                                               try {
//                                                                 if (widget
//                                                                         .label ==
//                                                                     'Monday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       1);
//                                                                 } else if (widget
//                                                                         .label ==
//                                                                     'Tuesday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       2);
//                                                                 } else if (widget
//                                                                         .label ==
//                                                                     'Wednesday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       3);
//                                                                 } else if (widget
//                                                                         .label ==
//                                                                     'Thursday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       4);
//                                                                 } else if (widget
//                                                                         .label ==
//                                                                     'Friday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       5);
//                                                                 } else if (widget
//                                                                         .label ==
//                                                                     'Saturday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       6);
//                                                                 } else if (widget
//                                                                         .label ==
//                                                                     'Sunday') {
//                                                                   _setupAlarm(
//                                                                       hour,
//                                                                       minute,
//                                                                       7);
//                                                                 }
//                                                                 print(
//                                                                     'success');
//                                                               } catch (e) {
//                                                                 print(
//                                                                     '$e error');
//                                                               }
//                                                               Navigator.of(
//                                                                       context)
//                                                                   .pushReplacement(
//                                                                       MaterialPageRoute(
//                                                                           builder: (context) =>
//                                                                               HomeScreen()));

//                                                               Fluttertoast
//                                                                   .showToast(
//                                                                       msg:
//                                                                           'Schedule added!');
//                                                             }),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           }));
//                                         });
//                                   },
//                                   icon: const Icon(
//                                     Icons.add_circle_outline_rounded,
//                                   ))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           child: ListView.separated(
//                               separatorBuilder: ((context, index) {
//                                 return const Divider();
//                               }),
//                               itemCount: classNames.length,
//                               itemBuilder: ((context, index) {
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 5),
//                                   child: Row(
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {
//                                           db
//                                               .collection(widget.label)
//                                               .doc(ids[index])
//                                               .delete();
//                                           Navigator.of(context).pushReplacement(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       HomeScreen()));

//                                           Fluttertoast.showToast(
//                                               msg: 'Deleted succesfully!');
//                                         },
//                                         icon: const Icon(Icons.delete,
//                                             color: Colors.red),
//                                       ),
//                                       TextRegular(
//                                           text: rooms[index],
//                                           fontSize: 12,
//                                           color: Colors.black),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 100,
//                                         child: Text(
//                                           classNames[index],
//                                           overflow: TextOverflow.ellipsis,
//                                           style: const TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.black,
//                                               fontFamily: 'QRegular'),
//                                         ),
//                                       ),
//                                       const Expanded(
//                                         child: SizedBox(
//                                           width: 10,
//                                         ),
//                                       ),
//                                       TextRegular(
//                                           text:
//                                               '${froms[index]} - ${tos[index]}',
//                                           fontSize: 12,
//                                           color: Colors.black),
//                                       const SizedBox(
//                                         width: 5,
//                                       ),
//                                       const Icon(
//                                         Icons.notifications,
//                                         color: Colors.grey,
//                                         size: 18,
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               })),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         : Padding(
//             padding: const EdgeInsets.only(top: 20, bottom: 20),
//             child: Center(
//               child: CircularProgressIndicator(
//                 color: primary,
//               ),
//             ),
//           );
//   }
// }
