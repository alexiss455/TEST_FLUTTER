import 'package:flutter/material.dart';
import 'package:FBM/components/_custom_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double height;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextOverflow? overflow;
  final bool softWrap;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.text,
    this.overflow,
    this.softWrap = true,
    this.maxLines,
    this.textAlign = TextAlign.start,
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
      textAlign: textAlign,
      style: baseStyle.merge(style),
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
    );
  }
}
