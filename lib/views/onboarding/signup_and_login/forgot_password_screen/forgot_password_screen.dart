import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import 'remembered_password.dart';
import 'send_reset_link_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppTheme.creame,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              Text(
                'FORGOT YOUR PASSWORD?',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/forgot_password.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 200,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter your registered email below to receive password reset instruction',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email Id',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SendResetLinkButton(controller: emailController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RememberedPasswordText(),
    );
  }
}
