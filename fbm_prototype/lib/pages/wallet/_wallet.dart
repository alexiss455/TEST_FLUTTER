import 'dart:ui';
import 'package:FBM/_data/data.dart';
import 'package:FBM/components/_custom_app_bar.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:FBM/components/_custom_top_nav.dart';
import 'package:FBM/helpers/date_format.dart';
import 'package:FBM/helpers/number_format.dart';
import 'package:FBM/pages/transaction/_transaction_listview.dart';
import 'package:FBM/pages/wallet/_wallet_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => WalletState();
}

class WalletState extends State<WalletPage>
    with SingleTickerProviderStateMixin {
  //
  final _scrollController = ScrollController();
  late TabController tabController;

  final tabs = ['Game Transactions', 'Withdrawal', 'Wallet Top Up'];
  bool _isScrolled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);

    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset > 1 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (_scrollController.offset <= 1 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final jsonData = JsonData();
    final double topPadding = MediaQuery.of(context).padding.top;
    final double appBarHeight = kToolbarHeight;
    final double totalTopPadding = topPadding + appBarHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _buildWalletHeader(),
          CustomNavTab(
            tabController: tabController,
            tabs: tabs,
          ),

          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                WalletListView(
                  groupedData: jsonData.groupedByMonth2,
                  itemBuilder: (i) => ListItem(i),
                ),
                TrasnactionListView(
                  groupedData: jsonData.groupedByMonth,
                  category: 'WITHDRAW',
                  itemBuilder: (i) => ListItem2(i),
                ),
                TrasnactionListView(
                  groupedData: jsonData.groupedByMonth,
                  category: 'TOP UP',
                  itemBuilder: (i) => ListItem2(i),
                ),
              ],
            ),
          ),

          //
        ],
      ),
    );
  }

  Widget _buildWalletHeader() {
    return Container(
      padding: EdgeInsets.only(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        left: AppColors.mainPadding,
        right: AppColors.mainPadding,
        bottom: AppColors.mainPadding,
      ),
      decoration: BoxDecoration(
        gradient: AppColors.gradient1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppColors.mainRadius2),
          bottomRight: Radius.circular(AppColors.mainRadius2),
        ),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "₱ 2,500",
                color: AppColors.white,
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                text: ".00",
                color: AppColors.white.withOpacity(0.3),
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/img/icon/icon-eye.svg'),
              ),
            ],
          ),
          CustomText(
            text: "My Wallet Balance",
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 5,
            children: [
              _buildWalletType(
                'Withdraw',
                'assets/img/icon/icon-widthdraw.svg',
              ),
              _buildWalletType(
                'Top Up',
                'assets/img/icon/icon-topup.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletType(String title, String icon) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppColors.mainRadius1)),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(AppColors.mainPadding),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              CustomText(
                text: title,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: item['branch'] ?? '',
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      textTransform: "capitalize",
                    ),
                    CustomText(
                      text: item['game_type'] ?? '',
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
                  text:
                      '${DateFormatHelper.format(item['date'] ?? '')} | ${DateFormatHelper.formatTime(item['date'] ?? '')}',
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

  Widget ListItem2(Map<String, dynamic> item) {
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
