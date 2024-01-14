import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_builder/app_theme.dart';

import 'habit_date_builder.dart';
import 'home_screen_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HomeScreenBanner(),
            HabitDateBuilder(scrollController: _scrollController),
            HabitFrequencyBuilder(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}

class HabitFrequencyBuilder extends StatelessWidget {
  const HabitFrequencyBuilder({super.key, required this.scrollController});
  final ScrollController scrollController;
  final Map<String, List<bool>> habitList = const {
    'Read A Book': [true, true, false, false, true, false, true],
    'Exercise': [false, true, false, false, true, false, true],
    'Wake Up Early': [false, true, true, true, true, false, true],
    'Walk Dog': [false, true, false, false, true, true, true],
  };
  final List<Color> availableColors = const [
    AppTheme.morning,
    AppTheme.sunset,
    AppTheme.twilight,
    AppTheme.eclipse
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: List.generate(
        habitList.length,
        (index) {
          int maxLength = 0;
          String nameOfHabit = habitList.keys.toList()[index];
          nameOfHabit = nameOfHabit.padRight(maxLength);
          final frequencyOfHabits = habitList.values.toList()[index];
          final currentColor = availableColors[index % availableColors.length];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  nameOfHabit,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final bool isSelected = frequencyOfHabits[index];
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(isSelected ? 10 : 20),
                            bottomRight: const Radius.circular(10),
                            topRight: const Radius.circular(10),
                            topLeft: const Radius.circular(10),
                          ),
                          color: isSelected
                              ? currentColor
                              : currentColor.withOpacity(0.2),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: isSelected
                            ? null
                            : SvgPicture.asset(
                                'assets/images/half_square.svg',
                                height: 50,
                                width: 50,
                                colorFilter: ColorFilter.mode(
                                  currentColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
