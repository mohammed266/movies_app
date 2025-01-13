


import 'package:flutter/material.dart';

import 'widgets/forget_pass_widgets/forget_pass_view_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: ForgetPassViewBody(),
      ),
    );
  }
}
