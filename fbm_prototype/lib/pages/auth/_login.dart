import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_input.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/pages/root_page.dart';

class LoginPage extends StatelessWidget {
  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RootPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // space header vs footer
          children: [
            // ----------- TOP CONTENT -----------
            SizedBox(height: 0),
            Column(
              children: [
                Image.asset('assets/img/logo/fbm_r_big.png'),
                SizedBox(height: 20),
                CustomText(
                  text: "FBM Casino Games and Solutions",
                  fontSize: 16,
                ),
                SizedBox(height: 40),
                CustomText(
                  text: "Login to your account",
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10),
                // Username field
                CustomInput(
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                          "assets/img/icon/icon-user-type1.svg"),
                    ),
                    placeholder: "Username",
                    type: TextInputType.text),

                SizedBox(height: 10),
                // Password field
                CustomInput(
                  icon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        SvgPicture.asset("assets/img/icon/icon-password.svg"),
                  ),
                  placeholder: "Password",
                  type: TextInputType.visiblePassword,
                ),
                SizedBox(height: 40),
                CustomButton(text: 'Login', onPressed: () => _login(context)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Forgot password?',
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),

            // ----------- FOOTER -----------
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'Don\'t have an account? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      child: CustomText(
                        text: 'Register here',
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
