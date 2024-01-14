import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_theme.dart';
import '../../../../controllers/auth_bloc/auth_bloc.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            onTap: () {
              context.read<AuthBloc>().add(
                    CreateUserWithEmailAndPasswordEvent(
                      emailId: emailController.text,
                      password: passwordController.text,
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
