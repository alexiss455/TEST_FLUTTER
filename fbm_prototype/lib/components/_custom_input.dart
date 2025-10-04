import 'package:FBM/components/_custom_colors.dart';
import 'package:flutter/material.dart';

enum CustomIconAlignment { left, right } // ✅ renamed to avoid conflict

class CustomInput extends StatelessWidget {
  final String? label;
  final String placeholder;
  final TextInputType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? icon;
  final CustomIconAlignment iconAlignment; // ✅ updated type
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomInput({
    Key? key,
    this.label,
    this.placeholder = '',
    this.type = TextInputType.text,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.icon,
    this.iconAlignment = CustomIconAlignment.left, // ✅ default left
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        hintStyle: TextStyle(color: AppColors.textSecondary),
        prefixIcon: iconAlignment == CustomIconAlignment.left ? icon : null,
        suffixIcon: iconAlignment == CustomIconAlignment.right ? icon : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 141, 144, 146),
            width: 1,
          ),
        ),
      ),
      keyboardType: type,
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
