import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/styles.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forget Password?',
          style: Styles.textStyle24,
        ),
        const SizedBox(height: 15),
        Text(
          'you forget your password? don\'t worry.\nplease enter your recovery email address',
          style: Styles.textStyle14,
        ),
        const SizedBox(height: 20),
        const CustomTextField(
          hintText: 'Email Address',
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onTap: () {},
            text: 'Submit',
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
