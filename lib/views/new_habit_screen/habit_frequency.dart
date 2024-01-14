import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_theme.dart';
import 'habit_frequency_week_days.dart';

class HabitFrequency extends StatelessWidget {
  const HabitFrequency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Habit Frequency',
                  style: theme.textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Custom ',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppTheme.morning,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: theme.textTheme.bodySmall?.fontSize,
                        color: AppTheme.morning,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const HabitFrequencyWeekDays(),
        ],
      ),
    );
  }
}
