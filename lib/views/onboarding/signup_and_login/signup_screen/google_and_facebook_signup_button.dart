import 'package:flutter/material.dart';

class GoogleAndFacebookSignUpButton extends StatelessWidget {
  const GoogleAndFacebookSignUpButton({
    super.key,
    required this.buttonText,
    required this.iconPath,
  });
  final String buttonText;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                iconPath,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
