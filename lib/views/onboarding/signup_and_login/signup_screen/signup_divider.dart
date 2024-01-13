import 'package:flutter/material.dart';

class SignUpDivider extends StatelessWidget {
  const SignUpDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        Text(
          '  Or sign up with  ',
          style: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
