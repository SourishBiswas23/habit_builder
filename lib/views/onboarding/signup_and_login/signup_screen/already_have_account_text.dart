import 'package:flutter/material.dart';
import 'package:habit_builder/routes.dart';

import '../../../../app_theme.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 14),
        ),
        InkWell(
          onTap: () => AppNavigator.pushReplace(
            appRoute: AppRoute.loginScreen,
          ),
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              shadows: [
                Shadow(
                  offset: Offset(0.2, 0.2),
                  color: AppTheme.eclipse,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
