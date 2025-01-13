import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    this.onChange,
    this.hintText,
    this.obscureText = false,
  });
  final String? hintText;
  final Function(String)? onChange;
  final bool obscureText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        // hintStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: const BorderSide(
        //     color: Colors.black,
        //   ),
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: const BorderSide(
        //     color: Colors.black38,
        //   ),
        // ),
      ),
    );
  }
}
