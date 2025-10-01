import 'package:FBM/components/_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? label;
  final controller = TextEditingController();
  final String placeholder;
  final TextInputType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;
  final Widget? icons;

  CustomInput({
    this.label,
    this.placeholder = '',
    this.type = TextInputType.text,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          hintStyle: TextStyle(color: AppColors.textSecondary),
          prefixIcon: icons,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 141, 144, 146), width: 1),
          ),
        ),
        keyboardType: type == TextInputType.number
            ? TextInputType.number
            : TextInputType.text,
      ),
    );
  }
}
