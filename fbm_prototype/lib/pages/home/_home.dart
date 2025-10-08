import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final double topWidgetHeight = 100.0;
  final double avatarRadius = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 👈 makes gradient go behind status bar
      appBar: AppBar(
        leadingWidth: 120,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 16.0), // 👈 left padding for logo
          child: Image.asset(
            'assets/img/logo/fbm_r_big.png',
            width: 100,
            height: 100,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0), // 👈 right padding for the icons
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(5),
                  icon: SvgPicture.asset('assets/img/icon/icon-notice.svg'),
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
        backgroundColor: AppColors.transparent,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              // color: AppColors.accent,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        top: 80, bottom: 16, left: 16, right: 16),
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 167, 27, 27),
                          AppColors.primary
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            CustomText(
                              text: "Welcome Juan!",
                              color: AppColors.white,
                              textAlign: TextAlign.center,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(
                                          text: "₱ 2,500",
                                          color: AppColors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        CustomText(
                                          text: ".00",
                                          color:
                                              AppColors.white.withOpacity(0.3),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800,
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
                                    text: "My Wallet Balance",
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          color:
                                              AppColors.white.withOpacity(0.3),
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              fontSize: 16,
                              text: 'Currently Playing',
                              onPressed: () => {},
                              isOutlined: true,
                              textColor: AppColors.white,
                              borderColor: AppColors.warningLight,
                              height: 55,
                              backGroundcolor:
                                  AppColors.warningLight.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 385,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: double.infinity,
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 14.0,
                                spreadRadius: 1.0,
                                offset: Offset(0, 2),
                              )
                            ])),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
