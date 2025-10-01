import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';

class IDConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Registration',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Personal Inforamtion',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text: 'Fill your personal information below.',
                      fontSize: 14,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'ID type ',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  CustomText(
                                    text: '* ',
                                    color: AppColors.primary,
                                  ),
                                ],
                              )
                            ]))
                  ])),
        ));
  }
}
