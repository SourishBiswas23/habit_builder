import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartHabitDialouge extends StatelessWidget {
  const StartHabitDialouge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 35, bottom: 20),
            padding: const EdgeInsets.only(
              top: 45,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'START THIS HABIT',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Text(
                  "Embark on a journey of positive change by committing to 'Start this habit' today.",
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SvgPicture.asset('assets/images/down_arrow.svg'),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Image.asset(
            'assets/images/start_habit_icon.png',
            height: 70,
            width: 70,
          ),
        ],
      ),
    );
  }
}
