import 'package:flutter/material.dart';

class CourseBanner extends StatelessWidget {
  const CourseBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/images/course_banner.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HABIT COURSES',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Your roadmap to positive change,\n providing structured guidance for \nlasting habits and personal growth',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
