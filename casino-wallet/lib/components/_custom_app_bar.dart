import 'package:casino/components/_custom_colors.dart';
import 'package:casino/components/_custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color? titleColor;
  const CustomAppBar({
    super.key,
    this.title = '',
    this.leading,
    this.actions,
    this.titleColor,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 1.0,
      automaticallyImplyLeading: true, // ✅ Uses default native back behavior
      title: CustomText(
        text: title,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: titleColor ?? AppColors.textPrimary,
      ),
      centerTitle: true,
      leading: leading, // Optional override
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
