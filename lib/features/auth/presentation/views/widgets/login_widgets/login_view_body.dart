import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../../core/resources/styles.dart';
import 'login_form.dart';
import 'sing_up_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'SingIn',
          style: Styles.textStyle30,
        ),
        24.verticalSpace,
        const LoginForm(),
        16.verticalSpace,
        const SingUpText(),
      ],
    );
  }
}

