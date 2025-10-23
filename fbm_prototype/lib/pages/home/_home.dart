import 'dart:ui';
import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:FBM/pages/home/_home_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    //
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });

    //
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
    final screen = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true, // gradient go behind status bar
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: _isScrolled ? 12.0 : 0.0,
                sigmaY: _isScrolled ? 12.0 : 0.0,
              ),
              child: AppBar(
                backgroundColor: _isScrolled
                    ? AppColors.white.withOpacity(0)
                    : _isLoading
                        ? AppColors.primary
                        : AppColors.transparent,
                elevation: 0,
                leadingWidth: 120,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset(
                    'assets/img/logo/fbm_r_big.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                              'assets/img/icon/icon-notice.svg'),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                              'assets/img/icon/icon-notification-type1.svg'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            top: false,
            child: LayoutBuilder(builder: (context, constraints) {
              if (_isLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primary),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                                // color: AppColors.accent,
                                child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 70, left: 16, right: 16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 76, 4, 4),
                                        AppColors.primary,
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: 5,
                                        children: [
                                          CustomText(
                                            text: "Welcome Juan!",
                                            color: AppColors.white,
                                            textAlign: TextAlign.center,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomText(
                                                text: "₱ 2,500",
                                                color: AppColors.white,
                                                fontSize: 32,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              CustomText(
                                                text: ".00",
                                                color: AppColors.white
                                                    .withOpacity(0.3),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              IconButton(
                                                  onPressed: () => {},
                                                  icon: SvgPicture.asset(
                                                      'assets/img/icon/icon-eye.svg')),
                                            ],
                                          ),
                                          CustomText(
                                              text: "My Wallet Balance",
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomText(
                                                    text: "₱ 10",
                                                    color: AppColors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  CustomText(
                                                    text: ".00",
                                                    color: AppColors.white
                                                        .withOpacity(0.3),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  IconButton(
                                                      onPressed: () => {},
                                                      icon: SvgPicture.asset(
                                                          'assets/img/icon/icon-eye.svg')),
                                                ],
                                              ),
                                            ],
                                          ),
                                          CustomText(
                                            textAlign: TextAlign.center,
                                            text: "Loyalty Funds",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            height: 0.5,
                                          ),
                                          SizedBox(height: 10),
                                          CustomButton(
                                            fontSize: 16,
                                            text: 'Currently Playing',
                                            onPressed: () => {},
                                            border: true,
                                            borderColor: AppColors.warningLight,
                                            height: 55,
                                            backGroundcolor: AppColors
                                                .warningLight
                                                .withOpacity(0.2),
                                          ),
                                          SizedBox(height: 130),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 90),
                              ],
                            )),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                width: double.infinity,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(
                                            AppColors.mainRadius),
                                        boxShadow: [AppColors.shadow1]),
                                    child: ActionGrid(items: [
                                      ActionItem(
                                        icon:
                                            'assets/img/icon/icon-transfer.svg',
                                        label: 'Transfer',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                      ActionItem(
                                        icon: 'assets/img/icon/icon-topup.svg',
                                        label: 'Top Up',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                      ActionItem(
                                        icon:
                                            'assets/img/icon/icon-withdraw.svg',
                                        label: 'Withdraw',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                      ActionItem(
                                        icon: 'assets/img/icon/icon-refer.svg',
                                        label: 'Refer',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                      ActionItem(
                                        icon:
                                            'assets/img/icon/icon-wallet-type1.svg',
                                        label: 'My Wallet',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                      ActionItem(
                                        icon:
                                            'assets/img/icon/icon-scan-type1.svg',
                                        label: 'Scan',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                      ActionItem(
                                        icon:
                                            'assets/img/icon/icon-my-account.svg',
                                        label: 'My Account',
                                        onTap: () {},
                                        color: AppColors.primary,
                                      ),
                                    ])),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: CustomText(
                              fontWeight: FontWeight.w600,
                              text: 'Enjoy Amazing Promos',
                              textAlign: TextAlign.left,
                            )),
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          scrollDirection: Axis.horizontal,
                          child: Row(spacing: 20, children: [
                            _buildItemPromos(1,
                                'FBM® prepares a sparkling exhibition for ICE Barcelona with the debut of Croc’s Lock'),
                            _buildItemPromos(2,
                                'Join the Game Art in the casino games universe and win amazing prizes')
                          ]),
                        ),
                      ]));
            })));
  }

  _buildItemPromos(int promo, String pLabel) {
    return Container(
      width: 230,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        boxShadow: [AppColors.shadow1],
        borderRadius: BorderRadius.circular(AppColors.mainRadius),
      ),
      child: Column(
        children: [
          Image.asset('assets/img/bg/img-promo$promo.png'),
          Container(
            height: 80,
            color: AppColors.white,
            padding: const EdgeInsets.all(15),
            child: CustomText(
              fontSize: 12,
              height: 1.25,
              text: pLabel,
            ),
          ),
        ],
      ),
    );
  }
}
