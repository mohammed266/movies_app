import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';

class SingUpText extends StatelessWidget {
  const SingUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: Styles.textStyle14,
          ),
          TextSpan(
            text: ' Sing Up',
            style: Styles.textStyle16,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.kSingUpView);
              },
          ),
        ],
      ),
    );
  }
}
