import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionGrid extends StatelessWidget {
  final List<ActionItem> items;
  final int itemsPerRow;

  const ActionGrid({
    super.key,
    required this.items,
    this.itemsPerRow = 4,
  });

  @override
  Widget build(BuildContext context) {
    List<List<ActionItem?>> rows = [];
    for (int i = 0; i < items.length; i += itemsPerRow) {
      final chunk = items.sublist(
        i,
        (i + itemsPerRow > items.length) ? items.length : i + itemsPerRow,
      );

      List<ActionItem?> row = List<ActionItem?>.from(chunk);

      while (row.length < itemsPerRow) {
        row.add(null);
      }

      rows.add(row);
    }

    return Column(
      spacing: 30,
      children: rows.map((row) {
        return Row(
          children: row.map((ActionItem? item) {
            if (item == null) {
              // render empty space for missing item
              return const Expanded(
                child: SizedBox(width: 1),
              );
            }

            // render real action item
            return Expanded(
              child: GestureDetector(
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
                      SizedBox(height: 4),
                      CustomText(
                        text: item.label,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            );
          }).toList(),
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
