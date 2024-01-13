import 'package:flutter/material.dart';
import 'package:habit_builder/app_theme.dart';

class EmailAndPasswordField extends StatefulWidget {
  const EmailAndPasswordField({
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
  State<EmailAndPasswordField> createState() => _EmailAndPasswordFieldState();
}

class _EmailAndPasswordFieldState extends State<EmailAndPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && obscureText,
      style: const TextStyle(color: AppTheme.morning),
      decoration: InputDecoration(
        hintText: widget.hintText,
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
