import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.label, this.onTap, this.textStyle, this.color});
  final String label;
  final Color? color;
  final void Function()? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Text(
          label,
          style: textStyle ??
              TextStyle(
                  color: color ?? Color(0xFF009486),
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
