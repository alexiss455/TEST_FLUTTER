import 'package:flutter/material.dart';
import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_input.dart';
import 'package:FBM/components/_custom_text.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                              text: 'First Name ',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(text: '*', color: AppColors.primary)
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        CustomInput(
                          placeholder: 'Enter your first name',
                        )
                      ])),
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Email ',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(text: '*', color: AppColors.primary)
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        CustomInput(
                          placeholder: 'Enter your valid email address',
                        )
                      ])),
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Passowrd ',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(text: '*', color: AppColors.primary)
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        CustomInput(
                          placeholder: 'Create your password',
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 14, color: Colors.black, height: 1.5),
                            children: [
                              TextSpan(
                                  text: '* ',
                                  style: TextStyle(color: AppColors.primary)),
                              TextSpan(
                                style: TextStyle(
                                    height: 1, color: AppColors.textPrimary),
                                text:
                                    'minimum 8 characters, at least one upper and lowercase,\n'
                                    '\u00A0\u00A0and at least one symbol and number',
                              ),
                            ],
                          ),
                        )
                      ])),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Referal Code (if Applicable) ',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(text: '*', color: AppColors.primary)
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      CustomInput(
                        placeholder: 'Enter referal code',
                        type: TextInputType.visiblePassword,
                      )
                    ]),
              )
            ])),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: 'Next',
          color: AppColors.primary,
          onPressed: () => {Navigator.pushNamed(context, '/id-confirmation')},
        ),
      ),
    );
  }
}
