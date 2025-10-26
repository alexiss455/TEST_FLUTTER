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
  final String textTransform;

  const CustomText({
    Key? key,
    required this.text,
    this.overflow,
    this.softWrap = true,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.fontSize = 14,
    this.color = AppColors.textPrimary,
    this.fontWeight = FontWeight.normal,
    this.height = 1.5,
    this.style,
    this.textTransform = "none",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayText = text;

    switch (textTransform) {
      case "uppercase":
        displayText = text.toUpperCase();
        break;
      case "lowercase":
        displayText = text.toLowerCase();
        break;
      case "capitalize":
        displayText = text
            .split(' ')
            .map((word) => word.isNotEmpty
                ? word[0].toUpperCase() + word.substring(1).toLowerCase()
                : '')
            .join(' ');
        break;
      default:
        displayText = text;
    }

    final baseStyle = TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );

    return Text(
      displayText,
      textAlign: textAlign,
      style: baseStyle.merge(style),
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
    );
  }
}
