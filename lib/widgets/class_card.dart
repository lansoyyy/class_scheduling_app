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
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextRegular(
                          text: label, fontSize: 28, color: Colors.black),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                          ))
                    ],
                  ),
                ),
                height: 50,
                color: primary,
                width: double.infinity,
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.separated(
                        itemCount: 50,
                        separatorBuilder: ((context, index) {
                          return Divider(
                            color: Colors.grey,
                          );
                        }),
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                            child: Row(
                              children: [
                                TextRegular(
                                    text: 'Room ${index}',
                                    fontSize: 12,
                                    color: Colors.black),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
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
                                Expanded(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                TextRegular(
                                    text: '7:30AM - 9:00AM',
                                    fontSize: 12,
                                    color: Colors.black),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
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
