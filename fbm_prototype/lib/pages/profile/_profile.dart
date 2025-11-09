import 'package:FBM/components/_custom_app_bar.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: CustomText(
          text: 'Profile',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppColors.white,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.accent,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: AppColors.gradient1,
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(AppColors.mainRadius2),
                                  bottomRight:
                                      Radius.circular(AppColors.mainRadius2))),
                          child: Column(
                            children: [
                              const SizedBox(height: 90.0),
                              Container(
                                width: 90,
                                height: 90,
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: SvgPicture.asset(
                                  'assets/img/icon/icon-profile.svg',
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              CustomText(
                                text: 'Juan Dela Cruz',
                                fontSize: 20,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                text: '+63 912 456 7896',
                                color: AppColors.greyLight3.withOpacity(0.65),
                                fontSize: 16,
                              ),
                              const SizedBox(height: 50.0),
                            ],
                          ),
                        ),
                        const SizedBox(height: 200.0),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(AppColors.mainPadding),
                      width: double.infinity,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [AppColors.shadow1],
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppColors.mainRadius1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20),
                              child: CustomText(
                                text: 'Pofile Settings',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: double.infinity,
                                )
                              ],
                            ),
                            CustomText(text: 'Test'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
