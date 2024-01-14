import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_builder/controllers/habit_bloc/habit_bloc.dart';
import 'package:habit_builder/views/common/reminder_time_selector.dart';

import '../../app_theme.dart';

class Reminder extends StatelessWidget {
  const Reminder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        reminderTimeSelector();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reminder',
              style: theme.textTheme.bodyMedium,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<HabitBloc, HabitState>(
                  builder: (context, state) {
                    return Text(
                      state.time,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppTheme.morning,
                      ),
                    );
                  },
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: theme.textTheme.bodySmall?.fontSize,
                  color: AppTheme.morning,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
