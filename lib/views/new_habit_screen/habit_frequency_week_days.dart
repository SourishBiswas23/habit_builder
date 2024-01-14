import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_theme.dart';

class HabitFrequencyWeekDays extends StatefulWidget {
  const HabitFrequencyWeekDays({super.key});

  @override
  State<HabitFrequencyWeekDays> createState() => _HabitFrequencyWeekDaysState();
}

class _HabitFrequencyWeekDaysState extends State<HabitFrequencyWeekDays> {
  final weekDays = const ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: weekDays.map(
        (weekDay) {
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: weekDay == weekDays.first
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  bottomRight: weekDay == weekDays.last
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                ),
                border: Border(
                  top: const BorderSide(
                    width: 1,
                    color: AppTheme.creame,
                  ),
                  right: weekDay != weekDays.last
                      ? const BorderSide(
                          width: 1,
                          color: AppTheme.creame,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      weekDay,
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        height: 34,
                        width: 34,
                        padding: isSelected
                            ? EdgeInsets.zero
                            : const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              isSelected ? AppTheme.morning : AppTheme.creame,
                        ),
                        child: isSelected
                            ? null
                            : SvgPicture.asset(
                                'assets/images/half_square.svg',
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  AppTheme.morning,
                                  BlendMode.srcIn,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
