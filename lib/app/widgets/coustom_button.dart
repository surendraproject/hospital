import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xff0EBE7F),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600
        );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle ?? defaultTextStyle,
          ),
        ),
      ),
    );
  }
}
