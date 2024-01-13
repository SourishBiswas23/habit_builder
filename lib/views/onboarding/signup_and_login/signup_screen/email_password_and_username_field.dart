import 'package:flutter/material.dart';
import 'package:habit_builder/app_theme.dart';

class EmailPasswordAndUsernameField extends StatefulWidget {
  const EmailPasswordAndUsernameField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.keyboardType,
    this.isPassword = false,
  });
  final String hintText;
  final IconData iconData;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  State<EmailPasswordAndUsernameField> createState() =>
      _EmailPasswordAndUsernameFieldState();
}

class _EmailPasswordAndUsernameFieldState
    extends State<EmailPasswordAndUsernameField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && obscureText,
      style: const TextStyle(color: AppTheme.morning),
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: Colors.white,
        prefixIcon: Icon(
          widget.iconData,
        ),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );
  }
}
