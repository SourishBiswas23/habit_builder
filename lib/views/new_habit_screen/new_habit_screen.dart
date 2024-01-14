import 'package:flutter/material.dart';

import 'habit_frequency.dart';
import 'habit_name_and_field_button.dart';
import 'notifications.dart';
import 'remider.dart';
import 'start_habit_dialogue.dart';

class NewHabitScreen extends StatelessWidget {
  const NewHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HabitNameFieldAndButton(),
            SizedBox(height: 10),
            HabitFrequency(),
            SizedBox(height: 10),
            Reminder(),
            SizedBox(height: 10),
            Nofitications(),
            SizedBox(height: 10),
            StartHabitDialouge(),
          ],
        ),
      ),
    );
  }
}
