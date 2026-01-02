import 'package:casino/components/_custom_app_bar.dart';
import 'package:casino/components/_custom_colors.dart';
import 'package:casino/components/_custom_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionDetailsPage extends StatelessWidget {
  final id;
  const TransactionDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Game Transaction Details'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset('assets/img/icon/icon-map.svg'),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: 'Sm North Edsa',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                        height: 1.25,
                        textAlign: TextAlign.center,
                        text:
                            'North Avenue, corner Epifanio de los Santos Ave, Quezon City, 1100 Metro Manila'),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(16),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(AppColors.mainRadius1),
                dashPattern: [6, 3],
                color: AppColors.greyLight,
                strokeWidth: 1,
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.blueLight1,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppColors.mainRadius1)),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.blueLight,
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppColors.circleRadius),
                              ),
                            ),
                            child: CustomText(
                              text: 'SLOT MACHINE 1',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              CustomText(
                                text: 'You have Top Up an amount of',
                                fontSize: 16,
                                height: 1.25,
                              ),
                              Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 5,
                                runSpacing: -2,
                                children: [
                                  CustomText(
                                    text: '₱ 800.00',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                    fontSize: 16,
                                  ),
                                  CustomText(
                                    text: 'on',
                                    fontSize: 16,
                                  ),
                                  CustomText(
                                    text: 'March 12, 2025',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  CustomText(
                                    text: 'at',
                                    fontSize: 16,
                                  ),
                                  CustomText(
                                    text: '2:40PM',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
