import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../app_theme.dart';
import 'email_and_password_field.dart';
import 'login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: size.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2222, 0.5],
                    colors: [AppTheme.transparentWhite, AppTheme.creame],
                  ),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'WELCOME TO',
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      'MONUMENTAL HABITS',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              'assets/logo/google_logo.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              'assets/logo/facebook_logo.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            'Continue with Facebook',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                color: AppTheme.creame,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log in with email',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      const EmailAndPasswordField(
                        hintText: 'Email Id',
                        iconData: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      const EmailAndPasswordField(
                        hintText: 'Password',
                        iconData: Icons.lock_outline,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 10),
                      const LoginButton(),
                      const SizedBox(height: 10),
                      const Text(
                        'Forgot Password ?',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          InkWell(
                            onTap: () => Logger().i('Signed Up'),
                            child: const Text(
                              'Sign Up',
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
