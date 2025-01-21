import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../auth/presentation/manager/auth_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.h, left: 16.w),
      width: 250.w,
      color: Colors.black38,
      child: SafeArea(
        child: Column(
          children: [
            Text('Cinema', style: Styles.textStyle30),
            50.verticalSpace,
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  Navigator.pushReplacementNamed(context, Routes.kLoginView);
                } else if (state is LogoutFailure) {
                  // Show error message if logout fails
                  log(state.errMessage);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMessage)),
                  );
                } else if (state is AuthLoading) {
                  // Optionally show a loading spinner
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logging out...')),
                  );
                }
              },
              child: ListTile(
                onTap: () async {
                  final userName = await SharedPrefHelper.getSecuredString(
                      key: SharedPrefKeys.userName);
                  final pass =
                  await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.pass);
                  log(userName);
                  final requestBody = {
                    'username': userName,
                    'password': pass,
                  };
                  context.read<AuthCubit>().deleteSession(requestBody);
                },
                title: Text(
                  'Log out',
                  style: Styles.textStyle20,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
