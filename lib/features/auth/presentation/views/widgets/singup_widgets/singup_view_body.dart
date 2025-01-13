import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'log_in_text.dart';
import 'singup_form.dart';

import '../../../../../../core/resources/styles.dart';

class SingUpViewBody extends StatelessWidget {
  const SingUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SignUp',
            style: Styles.textStyle30,
          ),
          24.verticalSpace,
          const SingUpForm(),
          16.verticalSpace,
          const LogInText(),
        ],
      ),
    );
  }
}
