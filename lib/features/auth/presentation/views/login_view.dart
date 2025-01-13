import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/login_widgets/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(
          top: 200.h,
          left: 16,
          right: 16,
        ),
        child: const SingleChildScrollView(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
