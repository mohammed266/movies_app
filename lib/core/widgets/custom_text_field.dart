import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    this.onChange,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode,
  });
  final String? hintText;
  final Function(String)? onChange;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: autovalidateMode,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        // hintStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        suffixIcon: suffixIcon,
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
