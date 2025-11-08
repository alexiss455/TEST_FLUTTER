import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:FBM/components/_custom_top_nav_tab.dart';
import 'package:FBM/helpers/date_format.dart';
import 'package:FBM/helpers/number_format.dart';
import 'package:FBM/pages/transaction/_transaction_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../_data/data.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => TransactionsPageState();
}

class TransactionsPageState extends State<TransactionsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final tabs = ['All', 'Withdraw', 'Top Up'];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final jsonData = JsonData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Transaction',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomNavTab(tabController: tabController, tabs: tabs),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TrasnactionListView(
                      groupedData: jsonData.groupedByMonth,
                      itemBuilder: (item) => ListItem(item)),
                  TrasnactionListView(
                      groupedData: jsonData.groupedByMonth,
                      category: 'WITHDRAW',
                      itemBuilder: (item) => ListItem(item)),
                  TrasnactionListView(
                      groupedData: jsonData.groupedByMonth,
                      category: 'TOP UP',
                      itemBuilder: (item) => ListItem(item)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ListItem(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/transactions/${item['id']}');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: AppColors.mainPadding, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.greyLight3, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyLight2),
                    borderRadius: BorderRadius.circular(AppColors.circleRadius),
                  ),
                  child: SvgPicture.asset(
                    'assets/img/logo/pnb.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: item['category'] ?? '',
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      textTransform: "capitalize",
                    ),
                    CustomText(
                      text: item['merchant'] ?? '',
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  text: 'Php ${NumberFormat.format(item['amount'] ?? 0)}',
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: DateFormatHelper.format(item['date'] ?? ''),
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
