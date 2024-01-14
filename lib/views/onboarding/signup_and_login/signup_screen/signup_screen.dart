import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import 'already_have_account_text.dart';
import 'create_account_button.dart';
import 'email_password_and_username_field.dart';
import 'google_and_facebook_signup_button.dart';
import 'signup_divider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/create_your_account.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 200,
              ),
              Text(
                'CREATE YOUR ACCOUNT',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  EmailPasswordAndUsernameField(
                    hintText: 'Username',
                    iconData: Icons.person_outline,
                    keyboardType: TextInputType.name,
                    controller: userNameController,
                  ),
                  const SizedBox(height: 10),
                  EmailPasswordAndUsernameField(
                    hintText: 'Email Id',
                    iconData: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  EmailPasswordAndUsernameField(
                    hintText: 'Password',
                    iconData: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 10),
                  CreateAccountButton(
                    emailController: emailController,
                    passwordController: passwordController,
                    userNameController: userNameController,
                  ),
                  const SizedBox(height: 5),
                  const SignUpDivider(),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GoogleAndFacebookSignUpButton(
                        buttonText: 'Google',
                        iconPath: 'assets/logo/google_logo.png',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AlreadyHaveAccountText(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
