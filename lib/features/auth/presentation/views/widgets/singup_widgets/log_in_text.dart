import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/styles.dart';

class LogInText extends StatelessWidget {
  const LogInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Do you already have an account ?',
            style: Styles.textStyle14,
          ),
          TextSpan(
            text: ' LogIn',
            style: Styles.textStyle16,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pop();
              },
          ),
        ],
      ),
    );
  }
}
