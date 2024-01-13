import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import 'already_have_account_text.dart';
import 'create_account_button.dart';
import 'email_password_and_username_field.dart';
import 'google_and_facebook_signup_button.dart';
import 'signup_divider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  EmailPasswordAndUsernameField(
                    hintText: 'Username',
                    iconData: Icons.person_outline,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10),
                  EmailPasswordAndUsernameField(
                    hintText: 'Email Id',
                    iconData: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  EmailPasswordAndUsernameField(
                    hintText: 'Password',
                    iconData: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 10),
                  CreateAccountButton(),
                  SizedBox(height: 5),
                  SignUpDivider(),
                  SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GoogleAndFacebookSignUpButton(
                        buttonText: 'Google',
                        iconPath: 'assets/logo/google_logo.png',
                      ),
                      SizedBox(width: 20),
                      GoogleAndFacebookSignUpButton(
                        buttonText: 'Facebook',
                        iconPath: 'assets/logo/facebook_logo.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  AlreadyHaveAccountText(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
