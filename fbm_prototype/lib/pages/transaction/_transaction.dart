import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:FBM/helpers/date_format.dart';
import 'package:FBM/helpers/number_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../_data/data.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => TransactionsPageState();
}

class TransactionsPageState extends State<TransactionsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = ['All', 'Withdraw', 'Top Up'];

  void _handleTabSelection(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 5.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.05),
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppColors.mainRadius)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 6.0,
                  children: _tabs.asMap().entries.map((entry) {
                    final index = entry.key;
                    final tab = entry.value;
                    final isActive = _tabController.index == index;
                    return Expanded(
                        flex: 1,
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.circular(AppColors.subRadius),
                              onTap: () => _handleTabSelection(index),
                              child: GestureDetector(
                                onTap: () => _handleTabSelection(index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? AppColors.primary.withOpacity(0.2)
                                        : AppColors.white,
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 243, 243, 243)),
                                    borderRadius: BorderRadius.circular(
                                        AppColors.subRadius),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: tab,
                                      color: isActive
                                          ? AppColors.primary
                                          : AppColors.textPrimary,
                                      fontWeight: isActive
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            )));
                  }).toList(),
                ),
              ),
            ),
            //
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  /// 🧾 ALL TRANSACTIONS (Grouped by Month)
                  ListView(
                    children: jsonData.groupedByMonth.map((group) {
                      final month = group['category_month'];
                      final transactions = group['items'] as List<dynamic>;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: CustomText(
                              text: DateFormat.formatMonth(month),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ...transactions
                              .map((item) => _TransactionItem(item))
                              .toList(),
                        ],
                      );
                    }).toList(),
                  ),

                  /// 💸 WITHDRAW (Grouped by Month)
                  ListView(
                    children: jsonData.groupedByMonth.map((group) {
                      final month = group['category_month'];
                      final transactions = (group['items'] as List<dynamic>)
                          .where((item) => item['category'] == 'WITHDRAW')
                          .toList();

                      if (transactions.isEmpty) return const SizedBox.shrink();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: CustomText(
                              text: DateFormat.formatMonth(month),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ...transactions
                              .map((item) => _TransactionItem(item))
                              .toList(),
                        ],
                      );
                    }).toList(),
                  ),

                  /// 💰 TOP UP (Grouped by Month)
                  ListView(
                    children: jsonData.groupedByMonth.map((group) {
                      final month = group['category_month'];
                      final transactions = (group['items'] as List<dynamic>)
                          .where((item) => item['category'] == 'TOP UP')
                          .toList();

                      if (transactions.isEmpty) return const SizedBox.shrink();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: CustomText(
                              text: DateFormat.formatMonth(month),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ...transactions
                              .map((item) => _TransactionItem(item))
                              .toList(),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(List<Map<String, dynamic>> items) {
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) => _TransactionItem(item)).toList(),
      ),
    );
  }

  Widget _TransactionItem(Map<String, dynamic> item) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: AppColors.greyLight3, width: 1)),
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
                  width: 28,
                  height: 28,
                  'assets/img/logo/pnb.svg',
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
                text: DateFormat.format(item['date'] ?? ''),
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
