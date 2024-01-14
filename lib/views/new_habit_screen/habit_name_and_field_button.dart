import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_builder/routes.dart';

import '../../app_theme.dart';

class HabitNameFieldAndButton extends StatelessWidget {
  const HabitNameFieldAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextField(
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              label: const Text('Enter habit name'),
              labelStyle: theme.textTheme.bodyMedium,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  // AppNavigator.
                },
                child: const FaIcon(
                  FontAwesomeIcons.bookOpenReader,
                  color: AppTheme.eclipse,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppTheme.morning,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const FaIcon(
                  FontAwesomeIcons.plus,
                  size: 10,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
