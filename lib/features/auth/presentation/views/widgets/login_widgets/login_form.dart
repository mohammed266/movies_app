import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
        ),
        24.verticalSpace,
        const CustomTextField(
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
        ),
        30.verticalSpace,
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.kForgetPassView);
            },
            child: Text(
              'Forget Password..?',
              style: Styles.textStyle18,
            ),
          ),
        ),
        40.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.kMyHomeView);
            },
            text: 'LogIn',
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
