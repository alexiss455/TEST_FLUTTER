import 'package:flutter/material.dart';
import '_custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backGroundcolor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;
  final double fontSize;
  final bool isOutlined; // 👈 outline toggle
  final Color borderColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backGroundcolor = AppColors.primary,
    this.textColor = AppColors.white,
    this.borderRadius = 16.0,
    this.height = 60,
    this.width = double.infinity,
    this.fontSize = 16,
    this.isOutlined = false, // 👈 default false
    this.borderColor = AppColors.primary, // 👈 default false
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0), // 👈 removes all shadows
          shadowColor: WidgetStateProperty.all(
              Colors.transparent), // 👈 ensure no shadow color
          backgroundColor: WidgetStateProperty.all(backGroundcolor),
          foregroundColor: WidgetStateProperty.all(
            isOutlined ? backGroundcolor : textColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: isOutlined
                  ? BorderSide(color: borderColor, width: 1)
                  : BorderSide.none,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
