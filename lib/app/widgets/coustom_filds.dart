import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? counterText;
  final Widget? suffixIcon;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.counterText,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorText: (errorText?.isNotEmpty ?? false) ? errorText : null,
        suffixIcon: suffixIcon,
        counterText: counterText,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xff67729429), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xff67729429), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xff67729429),
          ),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
