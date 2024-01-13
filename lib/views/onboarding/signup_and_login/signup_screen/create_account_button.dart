import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../app_theme.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            onTap: () => Logger().i('Create Account'),
            splashColor: Colors.orange,
            child: Ink(
              color: AppTheme.morning,
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  'Create Account',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
