import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/components/_custom_button.dart';
import 'package:food_app/pages/auth/_registration.dart';
import 'package:food_app/pages/root_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                Text(
                  "FBM Casino Games and Solutions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                // Username field
                TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                          "assets/img/icon/icon-user-type1.svg"),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 141, 144, 146),
                          width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Password field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:
                          SvgPicture.asset("assets/img/icon/icon-password.svg"),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 141, 144, 146),
                          width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomButton(text: 'Login', onPressed: () => _login(context)),
                SizedBox(height: 20),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 141, 144, 146),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            // ----------- FOOTER -----------
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have account yet ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (cotext) => Registration()));
                    },
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
