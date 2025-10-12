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
  final bool isOutlined;
  final Color borderColor;
  final bool isLoading;

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
    this.isOutlined = false,
    this.isLoading = false,
    this.borderColor = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed, // disable when loading
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(
            isOutlined ? Colors.transparent : backGroundcolor,
          ),
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
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: isOutlined ? backGroundcolor : textColor,
                ),
              ),
      ),
    );
  }
}
