import 'package:flutter/material.dart';
import 'package:FBM/components/_custom_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double height;
  final TextStyle? style; // 👈 accept an extra TextStyle override

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.textPrimary,
    this.fontWeight = FontWeight.normal,
    this.height = 1.5,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );

    return Text(
      text,
      style: baseStyle.merge(style), // 👈 merge user-defined style
    );
  }
}
