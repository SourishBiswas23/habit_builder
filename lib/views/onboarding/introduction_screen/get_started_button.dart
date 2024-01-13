import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../app_theme.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            child: InkWell(
              onTap: () => Logger().i('Tapped the button'),
              splashColor: Colors.orange,
              child: Ink(
                color: AppTheme.morning,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Get Started',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
