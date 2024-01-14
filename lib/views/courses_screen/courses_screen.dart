import 'package:flutter/material.dart';

import 'course_banner.dart';
import 'course_tile.dart';


class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});
  final List<Map<String, List<String>>> imageAndUrl = const [
    {
      'Atomic Habits': [
        'assets/images/atomic_habits.jpg',
        'https://www.youtube.com/watch?v=PZ7lDrwYdZc&pp=ygUTaG93IHRvIG1ha2UgYSBoYWJpdA%3D%3D',
        '28 min',
      ],
    },
    {
      'Forming Habits': [
        'assets/images/forming_habits.jpg',
        'https://www.youtube.com/watch?v=SDyWftcMZgA&pp=ygUTaG93IHRvIG1ha2UgYSBoYWJpdA%3D%3D',
        '4 min',
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CourseBanner(),
            const SizedBox(height: 10),
            ...imageAndUrl.map((entry) {
              final String courseName = entry.keys.toList()[0];
              final String courseImagePath = entry.values.toList()[0][0];
              final String courseUrl = entry.values.toList()[0][1];
              final String courseLength = entry.values.toList()[0][2];

              return CourseTile(
                courseUrl: courseUrl,
                courseImagePath: courseImagePath,
                courseName: courseName,
                courseLength: courseLength,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
