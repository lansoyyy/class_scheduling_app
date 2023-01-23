import 'package:class_scheduling_app/utils/colors.dart';
import 'package:class_scheduling_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  var label;

  ClassCard({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            color: brownAccet,
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          height: 250,
          child: Column(
            children: [
              Container(
                height: 50,
                color: primary,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextRegular(
                          text: label, fontSize: 28, color: Colors.black),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(
                                      height: 320,
                                      decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextBold(
                                                text: 'Adding Schedule',
                                                fontSize: 18,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextRegular(
                                                text: 'Class name/code:',
                                                fontSize: 12,
                                                color: Colors.black),
                                            SizedBox(
                                              height: 35,
                                              child: TextFormField(
                                                onChanged: ((value) {}),
                                                decoration:
                                                    const InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black), //<-- SEE HERE
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            TextRegular(
                                                text: 'Room:',
                                                fontSize: 12,
                                                color: Colors.black),
                                            SizedBox(
                                              height: 35,
                                              child: TextFormField(
                                                onChanged: ((value) {}),
                                                decoration:
                                                    const InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black), //<-- SEE HERE
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            TextRegular(
                                                text: 'Schedule:',
                                                fontSize: 12,
                                                color: Colors.black),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 35,
                                                  width: 100,
                                                  child: TextFormField(
                                                    onChanged: ((value) {}),
                                                    decoration:
                                                        const InputDecoration(
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black), //<-- SEE HERE
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: TextRegular(
                                                      text: 'to',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 35,
                                                  width: 100,
                                                  child: TextFormField(
                                                    onChanged: ((value) {}),
                                                    decoration:
                                                        const InputDecoration(
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black), //<-- SEE HERE
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 30),
                                            Center(
                                              child: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                });
                          },
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.separated(
                        itemCount: 50,
                        separatorBuilder: ((context, index) {
                          return const Divider(
                            color: Colors.grey,
                          );
                        }),
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                            child: Row(
                              children: [
                                TextRegular(
                                    text: 'Room $index',
                                    fontSize: 12,
                                    color: Colors.black),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'QRegular'),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                TextRegular(
                                    text: '7:30AM - 9:00AM',
                                    fontSize: 12,
                                    color: Colors.black),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.notifications,
                                  color: Colors.grey,
                                  size: 18,
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
