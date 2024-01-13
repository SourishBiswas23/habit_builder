import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
            width: double.infinity,
          ),
          Text(
            'WELCOME TO MONUMENTAL HABITS',
            style: theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/images/introduction-1.png'),
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'WE CAN',
              style: theme.textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: ' HELP YOU ',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: AppTheme.morning),
                ),
                TextSpan(
                  text: 'TO BE A BETTER',
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'VERSION OF',
              style: theme.textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: ' YOURSELF ',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: AppTheme.morning),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
