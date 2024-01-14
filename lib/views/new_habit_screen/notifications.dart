import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../app_theme.dart';

class Nofitications extends StatefulWidget {
  const Nofitications({
    super.key,
  });

  @override
  State<Nofitications> createState() => _NofiticationsState();
}

class _NofiticationsState extends State<Nofitications> {
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notification',
            style: theme.textTheme.bodyMedium,
          ),
          FlutterSwitch(
            height: 30,
            inactiveToggleColor: AppTheme.eclipse,
            value: isSwitchOn,
            showOnOff: true,
            activeTextColor: Colors.white,
            activeText: 'On',
            inactiveText: 'Off',
            inactiveColor: AppTheme.eclipse.withOpacity(0.1),
            activeColor: AppTheme.eclipse,
            inactiveTextColor: AppTheme.eclipse,
            onToggle: (value) {
              setState(() {
                isSwitchOn = !isSwitchOn;
              });
            },
          )
        ],
      ),
    );
  }
}
