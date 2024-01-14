import 'package:flutter/material.dart';

import '../common/completed_habit_snackbar.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => showSnackbar(),
          child: const Text('Show Snackbar'),
        ),
      ),
    );
  }
}
