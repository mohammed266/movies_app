import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hintText: 'Name',
          keyboardType: TextInputType.name,
        ),
        24.verticalSpace,
        const CustomTextField(
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
        ),
        24.verticalSpace,
        const CustomTextField(
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
        ),
        60.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.kMyHomeView);
            },
            text: 'Sign Up',
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
