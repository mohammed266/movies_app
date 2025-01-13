import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/singup_widgets/singup_view_body.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(
          top: 200.h,
          left: 16,
          right: 16,
        ),
        child: const SingUpViewBody(),
      ),
    );
  }
}
