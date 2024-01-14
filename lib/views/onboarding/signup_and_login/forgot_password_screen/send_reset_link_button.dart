import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_theme.dart';
import '../../../../controllers/auth_bloc/auth_bloc.dart';

class SendResetLinkButton extends StatelessWidget {
  const SendResetLinkButton({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            onTap: () {
              context.read<AuthBloc>().add(
                    SendPasswordResetEmailEvent(
                      emailId: controller.text,
                    ),
                  );
            },
            splashColor: Colors.orange,
            child: Ink(
              color: AppTheme.morning,
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  'Send Reset Link',
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
