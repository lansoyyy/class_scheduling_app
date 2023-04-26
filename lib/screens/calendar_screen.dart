import 'package:calendar_view/calendar_view.dart';
import 'package:class_scheduling_app/utils/colors.dart';
import 'package:class_scheduling_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:localstore/localstore.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // List<DateTime> mondaysIn2023 = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  late String className = '';

  late String room = '';

  late String from = '';

  late String to = '';

  final db = Localstore.instance;

  List<String> names = [];

  List<int> startMonths = [];

  List<int> startDates = [];

  List<int> startingHours = [];

  List<int> startingMinutes = [];

  List<int> endingHours = [];

  List<int> endingMinutes = [];

  late String newRoom = '';
  late String newInstructor = '';
  late String newSubject = '';

  List<String> ids = [];

  var hasLoaded = false;

  final List<CalendarEventData> _events = [];

  getData() async {
    _events.clear();
    final items = await db.collection('Sched').get();

    if (items != null) {
      List<dynamic> values1 = items.values.toList();

      for (var element in values1) {
        names.add(element['event']);
        startMonths.add(element['startMonth']);
        startDates.add(element['startDay']);
        startingHours.add(element['startHour']);
        startingMinutes.add(element['startMinute']);
        endingHours.add(element['endHour']);
        endingMinutes.add(element['endMinute']);

        ids.add(element['id']);
      }

      for (int i = 0; i < names.length; i++) {
        _events.add(CalendarEventData(
            description: ids[i],
            date: DateTime(2023, startMonths[i], startDates[i]),
            title: names[i],
            endTime: DateTime(2023, startMonths[i], startDates[i],
                endingHours[i], endingMinutes[i]),
            color: Colors.blue,
            startTime: DateTime(2023, startMonths[i], startDates[i],
                startingHours[i], startingMinutes[i]),
            endDate: DateTime(2023, startMonths[i], startDates[i])));
      }

      CalendarControllerProvider.of(context).controller.addAll(_events);
    }

    //  'event': className,
    //                                     'startMonth': startingMonth,
    //                                     'startDay': startingDate,
    //                                     'startHour': startHour,
    //                                     'startMinute': startMinutes,
    //                                     'endHour': endHour,
    //                                     'endMinute': endMinutes,

    setState(() {
      hasLoaded = true;
    });
  }

  late int startingDate;
  late int startingMonth;

  late int startHour;
  late int startMinutes;

  late int endHour;
  late int endMinutes;

  @override
  Widget build(BuildContext context) {
    print(_events);
    return RefreshIndicator(
      onRefresh: (() {
        return Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CalendarScreen()));
      }),
      child: Scaffold(
        appBar: AppBar(
          title: TextRegular(
              text: 'Scheduler Application', fontSize: 18, color: Colors.white),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: (() {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: ((context, setState) {
                      return Dialog(
                        child: Container(
                          height: 420,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextBold(
                                      text: 'Adding Event/Schedule',
                                      fontSize: 18,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Event name',
                                      fontSize: 12,
                                      color: Colors.black),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        className = value;
                                      }),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                          ),
                                          filled: true,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Room',
                                      fontSize: 12,
                                      color: Colors.black),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        newRoom = value;
                                      }),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                          ),
                                          filled: true,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Subject',
                                      fontSize: 12,
                                      color: Colors.black),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        newSubject = value;
                                      }),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                          ),
                                          filled: true,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Instructor',
                                      fontSize: 12,
                                      color: Colors.black),
                                  SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        newInstructor = value;
                                      }),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                          ),
                                          filled: true,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextRegular(
                                      text: 'Schedule:',
                                      fontSize: 12,
                                      color: Colors.black),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 300,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged:
                                            (DateTime newDateTime) {
                                          setState(() {
                                            startingMonth = newDateTime.month;
                                            startingDate = newDateTime.day;
                                          });

                                          // Handle the change
                                        },
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 300,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.time,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged:
                                            (DateTime newDateTime) {
                                          setState(() {
                                            startHour = newDateTime.hour;
                                            startMinutes = newDateTime.minute;
                                          });
                                          // Handle the change
                                        },
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: TextRegular(
                                          text: 'to',
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 300,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.time,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged:
                                            (DateTime newDateTime) {
                                          setState(() {
                                            endHour = newDateTime.hour;
                                            endMinutes = newDateTime.minute;
                                          });
                                          // Handle the change
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Center(
                                    child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        color: greenAccet,
                                        minWidth: 150,
                                        height: 40,
                                        child: TextRegular(
                                            text: 'Done',
                                            fontSize: 14,
                                            color: Colors.white),
                                        onPressed: () {
                                          final id =
                                              db.collection('Sched').doc().id;
                                          db.collection('Sched').doc(id).set({
                                            'event': className,
                                            'startMonth': startingMonth,
                                            'startDay': startingDate,
                                            'startHour': startHour,
                                            'startMinute': startMinutes,
                                            'endHour': endHour,
                                            'endMinute': endMinutes,
                                            'id': id,
                                            'subject': newSubject,
                                            'instructor': newInstructor,
                                            'room': newRoom
                                          });

                                          FlutterAlarmClock.createAlarm(
                                              startHour, startMinutes,
                                              title: 'Schedule: $className');

                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CalendarScreen()));
                                        }),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }));
                  });
            }),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: RefreshIndicator(
          onRefresh: () {
            return Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const CalendarScreen()));
          },
          child: WeekView(
            eventTileBuilder: (
              date,
              events,
              boundary,
              startDuration,
              endDuration,
            ) {
              return GestureDetector(
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return Dialog(
                          child: SizedBox(
                            height: 280,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRegular(
                                      text: 'Event/Task: ${events[0].title}',
                                      fontSize: 18,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextRegular(
                                      text: 'Date: ${events[0].date}',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextRegular(
                                      text: 'Room: ${events[0].date}',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextRegular(
                                      text:
                                          'Starting Time: ${events[0].startTime}',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextRegular(
                                      text: 'Ending Time: ${events[0].endTime}',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MaterialButton(
                                          color: Colors.blue,
                                          minWidth: 120,
                                          height: 40,
                                          onPressed: (() {
                                            Navigator.of(context).pop();
                                          }),
                                          child: TextRegular(
                                              text: 'Close',
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        MaterialButton(
                                          color: Colors.red,
                                          minWidth: 120,
                                          height: 40,
                                          onPressed: (() {
                                            db
                                                .collection('Sched')
                                                .doc(events[0].description)
                                                .delete();

                                            CalendarControllerProvider.of(
                                                    context)
                                                .controller
                                                .remove(events[0]);

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: TextRegular(
                                                        text:
                                                            'Task Deleted Succesfully!',
                                                        fontSize: 12,
                                                        color: Colors.white)));

                                            setState(() {});

                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CalendarScreen()));
                                          }),
                                          child: TextRegular(
                                              text: 'Delete',
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                }),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextRegular(
                        text: events[0].title,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
