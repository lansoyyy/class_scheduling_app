import 'package:class_scheduling_app/utils/colors.dart';
import 'package:class_scheduling_app/widgets/class_card.dart';
import 'package:class_scheduling_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: primary,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextBold(
                      text: 'Class Schedule',
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClassCard(label: 'Monday'),
            ClassCard(label: 'Tuesday'),
            ClassCard(label: 'Wednesday'),
            ClassCard(label: 'Thursday'),
            ClassCard(label: 'Friday'),
            ClassCard(label: 'Saturday'),
          ],
        ),
      ),
    );
  }
}
