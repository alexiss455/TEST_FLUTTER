import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_input.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/pages/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  void _login(BuildContext context) async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RootPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 60),
                              Image.asset(
                                'assets/img/logo/fbm_r_big.png',
                                filterQuality: FilterQuality.high,
                              ),
                              SizedBox(height: 10),
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
                              CustomInput(
                                icon: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/img/icon/icon-user-type1.svg",
                                  ),
                                ),
                                placeholder: "Username",
                                type: TextInputType.text,
                              ),
                              SizedBox(height: 10),
                              CustomInput(
                                icon: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    "assets/img/icon/icon-password.svg",
                                  ),
                                ),
                                placeholder: "Password",
                                type: TextInputType.visiblePassword,
                              ),
                              SizedBox(height: 40),
                              CustomButton(
                                text: 'Login',
                                onPressed: () => _login(context),
                              ),
                              SizedBox(height: 20),
                              CustomText(
                                text: 'Forgot password?',
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 60), // bottom spacing
                            ],
                          ),
                        ),
                      )),
                );
              },
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 20),
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
                  ),
                ),
              ],
            ),
          ),
        ),

        // Loader Overlay
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.8),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
