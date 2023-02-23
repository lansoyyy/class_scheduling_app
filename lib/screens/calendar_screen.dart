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
  final event = CalendarEventData(
      date: DateTime(2023, 2, 25),
      title: 'Sample',
      endTime: DateTime(2023, 2, 26),
      color: Colors.blue,
      startTime: DateTime(2023, 2, 25),
      endDate: DateTime(2023, 2, 26),
      event: 'qwe',
      description: 'asd');

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

  List<String> rooms = [];

  List<String> classNames = [];

  List<String> froms = [];

  List<String> tos = [];

  List<String> ids = [];

  var hasLoaded = false;

  getData() async {
    final items = await db.collection('Data').get();

    if (items != null) {
      List<dynamic> values1 = items.values.toList();

      values1.sort((a, b) => a['from'].compareTo(b['from']));

      for (var element in values1) {
        rooms.add(element['room']);
        classNames.add(element['className']);
        froms.add(element['from']);
        tos.add(element['to']);
        ids.add(element['id']);
      }
    }
    print(items);

    setState(() {
      hasLoaded = true;
    });
  }

  late int startingDate;
  late int startingMonth;
  late int endDate;
  late int endMonth;

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
            CalendarControllerProvider.of(context).controller.add(event);
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
                                height: 20,
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
                                            color: Colors.black), //<-- SEE HERE
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
                                    onDateTimeChanged: (DateTime newDateTime) {
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
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      setState(() {
                                        endMonth = newDateTime.month;
                                        endDate = newDateTime.day;
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
                                    onPressed: () {}),
                              ),
                            ],
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
