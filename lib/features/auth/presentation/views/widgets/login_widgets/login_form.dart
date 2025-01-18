import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../../core/helpers/toast_helper.dart';
import '../../../../../../core/helpers/validator.dart';
import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../manager/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hiddenPass = true;
  // Form controller
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            validator: (value) {
              return Validator.userNameValidator(value);
            },
            controller: userNameController,
            hintText: 'username',
            keyboardType: TextInputType.name,
            autovalidateMode: autoValidateMode,
          ),
          24.verticalSpace,
          CustomTextField(
            validator: (value) {
              return Validator.passwordValidator(value);
            },
            obscureText: hiddenPass,
            controller: passwordController,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            autovalidateMode: autoValidateMode,
            suffixIcon: buildIconButton(),
          ),
          30.verticalSpace,
          forgetPassText(context),
          40.verticalSpace,
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                // Handle successful session creation, navigate or show session id
                ToastHelper.showSuccessToast('Session created successfully');
                Navigator.pushNamed(context, Routes.kMyHomeView);
              } else if (state is AuthFailure) {
                // Show error message
                ToastHelper.showErrorToast(state.errMessage);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const CircularProgressIndicator();
              }
              return CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    final requestBody = {
                      'username': userNameController.text,
                      'password': passwordController.text,
                    };
                    SharedPrefHelper.setData(
                        key: SharedPrefKeys.userName,
                        value: userNameController.text);
                    SharedPrefHelper.setData(
                        key: SharedPrefKeys.pass,
                        value: passwordController.text);
                    context.read<AuthCubit>().createSession(requestBody);
                  }
                },
                text: 'LogIn',
                color: kPrimaryColor,
              );
            },
          ),
        ],
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          hiddenPass = !hiddenPass;
        });
      },
      icon: hiddenPass
          ? const Icon(Icons.visibility_off_outlined)
          : const Icon(Icons.visibility_outlined),
    );
  }

  Align forgetPassText(BuildContext context) {
    return Align(
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
    );
  }
}
