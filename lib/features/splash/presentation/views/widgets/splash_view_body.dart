import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.play_circle_outline,
          size: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
