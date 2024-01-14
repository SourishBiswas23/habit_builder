import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_builder/app_theme.dart';
import 'package:habit_builder/controllers/habit_bloc/habit_bloc.dart';
import 'package:habit_builder/routes.dart';

void reminderTimeSelector() {
  final buildContext = AppNavigator.navigatorKey.currentContext;
  final FixedExtentScrollController hourController =
      FixedExtentScrollController();
  final FixedExtentScrollController minutesController =
      FixedExtentScrollController();
  if (buildContext != null) {
    showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppTheme.morning),
                          ),
                        ),
                        Text(
                          'Add Reminders',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<HabitBloc>().add(UpdateTimeEvent(
                                time:
                                    '${hourController.selectedItem}:${minutesController.selectedItem}'));
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Save',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppTheme.morning),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TimePicker(
                    hourController: hourController,
                    minutesController: minutesController,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    required this.hourController,
    required this.minutesController,
  });
  final FixedExtentScrollController hourController;
  final FixedExtentScrollController minutesController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          width: 160,
          child: ListWheelScrollView.useDelegate(
            controller: hourController,
            itemExtent: 40,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 24,
              builder: (context, index) {
                return Text(
                  (index + 1).toString(),
                  style: theme.textTheme.headlineMedium,
                );
              },
            ),
          ),
        ),
        Text(
          ':',
          style: theme.textTheme.headlineLarge,
        ),
        SizedBox(
          height: 300,
          width: 160,
          child: ListWheelScrollView.useDelegate(
            controller: minutesController,
            itemExtent: 40,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 60,
              builder: (context, index) {
                return Text(
                  (index).toString(),
                  style: theme.textTheme.headlineMedium,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class AmPmButton extends StatefulWidget {
  const AmPmButton({
    super.key,
  });

  @override
  State<AmPmButton> createState() => _AmPmButtonState();
}

class _AmPmButtonState extends State<AmPmButton> {
  bool amSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (!amSelected) {
                setState(() {
                  amSelected = true;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: amSelected ? AppTheme.morning : AppTheme.creame,
              ),
              child: Center(
                child: Text(
                  'am',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: amSelected ? AppTheme.eclipse : AppTheme.morning,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (amSelected) {
                setState(() {
                  amSelected = false;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: !amSelected ? AppTheme.morning : AppTheme.creame,
              ),
              child: Center(
                child: Text(
                  'pm',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: !amSelected ? AppTheme.eclipse : AppTheme.morning,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
