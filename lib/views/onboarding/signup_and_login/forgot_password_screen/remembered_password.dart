import 'package:flutter/material.dart';
import 'package:habit_builder/routes.dart';

import '../../../../app_theme.dart';

class RememberedPasswordText extends StatelessWidget {
  const RememberedPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Remembered Password? ",
            style: TextStyle(fontSize: 14),
          ),
          InkWell(
            onTap: () => AppNavigator.pushReplace(
              appRoute: AppRoute.loginScreen,
            ),
            child: const Text(
              'Login',
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
      ),
    );
  }
}
