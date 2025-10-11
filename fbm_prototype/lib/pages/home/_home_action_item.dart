import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionGrid extends StatelessWidget {
  final List<ActionItem> items;

  const ActionGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 4,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      childAspectRatio: 1, // keep square-ish layout
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: items.map((item) {
        return GestureDetector(
          onTap: item.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                item.icon,
                width: 36,
                color: item.color,
              ),
              const SizedBox(height: 4),
              CustomText(
                text: item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ActionItem {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = AppColors.primary,
  });
}
