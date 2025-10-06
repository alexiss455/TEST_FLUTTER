import 'package:FBM/components/_custom_app_bar.dart';
import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';

class SelfieVerificationSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Selfie Verification Success"),
        body: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset('assets/img/bg/img-selfie-verified.png'),
                SizedBox(height: 20),
                CustomText(
                    text: 'Identity Verified',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary),
                CustomText(
                  text: 'Your identity has been successfully verified.',
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 40),
                CustomButton(
                  text: 'Go to Login',
                  onPressed: () => {Navigator.pushNamed(context, '/login')},
                )
              ])),
        ));
  }
}
