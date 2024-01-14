import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_builder/controllers/auth_bloc/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(SignOutEvent());
          },
          child: const Text('This is the settings screen'),
        ),
      ),
    );
  }
}
