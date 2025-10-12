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
      MaterialPageRoute(builder: (context) => const RootPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        final height = constraints.maxHeight;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/logo/fbm_r_big.png',
                          filterQuality: FilterQuality.high,
                          height: 100,
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
                      ],
                    ),
                  ),
                ),
              ),

              // ----------------- FAKE FULL LOADER -----------------
              if (isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      })),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(text: 'Don\'t have an account? '),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/registration');
              },
              child: const CustomText(
                text: 'Register here',
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
