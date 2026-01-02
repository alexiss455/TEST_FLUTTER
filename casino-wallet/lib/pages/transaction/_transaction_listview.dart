import 'package:casino/components/_custom_colors.dart';
import 'package:casino/components/_custom_text.dart';
import 'package:casino/helpers/date_format.dart';
import 'package:flutter/material.dart';

class TrasnactionListView extends StatelessWidget {
  final List<dynamic> groupedData;
  final String? category; // null means show all
  final Widget Function(dynamic item) itemBuilder;

  const TrasnactionListView({
    super.key,
    required this.groupedData,
    this.category,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: groupedData.map((group) {
        final month = group['category_month'];
        final transactions = (group['items'] as List<dynamic>)
            .where((item) =>
                category == null ? true : item['category'] == category)
            .toList();

        if (transactions.isEmpty) return SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppColors.mainPadding, vertical: 8.0),
              child: CustomText(
                text: DateFormatHelper.formatMonth(month),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...transactions.map(itemBuilder),
          ],
        );
      }).toList(),
    );
  }
}
