import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.courseUrl,
    required this.courseImagePath,
    required this.courseName,
    required this.courseLength,
  });

  final String courseUrl;
  final String courseImagePath;
  final String courseName;
  final String courseLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(courseUrl))) {
          launchUrl(Uri.parse(courseUrl));
        } else {
          Logger().i('Cannot launch url:$courseUrl');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(
                color: Colors.blue,
                child: Image.asset(
                  courseImagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                courseName,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                courseLength,
                style: theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
