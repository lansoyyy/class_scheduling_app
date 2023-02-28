import 'package:calendar_view/calendar_view.dart';
import 'package:class_scheduling_app/utils/colors.dart';
import 'package:class_scheduling_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

class CalendarScreen extends StatefulWidget {
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

  List<String> ids = [];

  var hasLoaded = false;

  final List<CalendarEventData> _events = [];

  getData() async {
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
    }

    print(items);

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
    return Scaffold(
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
                      child: SingleChildScrollView(
                        child: Container(
                          height: 420,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
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
                                              color:
                                                  Colors.black), //<-- SEE HERE
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
                                        borderRadius: BorderRadius.circular(5),
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
                                          'id': id
                                        });

                                        _events.add(CalendarEventData(
                                          date: DateTime(2023, startingMonth,
                                              startingDate),
                                          title: className,
                                          endTime: DateTime(
                                              2023,
                                              startingMonth,
                                              startingDate,
                                              endHour,
                                              endMinutes),
                                          color: Colors.blue,
                                          startTime: DateTime(
                                              2023,
                                              startingMonth,
                                              startingDate,
                                              startHour,
                                              startMinutes),
                                          endDate: DateTime(2023, startingMonth,
                                              startingDate),
                                        ));

                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CalendarScreen()));

                                        CalendarControllerProvider.of(context)
                                            .controller
                                            .addAll(_events);

                                        // FlutterAlarmClock
                                        //     .createAlarm(

                                        //         startHour,
                                        //         startMinutes,
                                        //         title:
                                        //             'Schedule: ${className}');
                                      }),
                                ),
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
      body: const WeekView(),
    );
  }
}
