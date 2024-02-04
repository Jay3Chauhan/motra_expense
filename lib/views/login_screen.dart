import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/utils/app_color.dart';

import 'home_screen.dart';
import 'onbordingscreens/forgotpassword_screen.dart';
import 'onbordingscreens/signup_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            children: [
              SizedBox(height: 40),
              SizedBox(height: 20),
              TextFormField(
                obscureText: false,
                controller: emailController,
                decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(top: 20, left: 20),
                    errorStyle: TextStyle(fontSize: 0),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.Light20,
                    ),
                    hintText: 'abc@xyz.com',
                    focusColor: AppColors.Violet100,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.Violet100, width: 1.5),
                        borderRadius: BorderRadius.circular(16.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscuringCharacter: '*',
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(top: 20, left: 20),
                    errorStyle: TextStyle(fontSize: 0),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.Light20,
                    ),
                    hintText: "Password",
                    focusColor: AppColors.Violet100,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.Violet100, width: 1.5),
                        borderRadius: BorderRadius.circular(16.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password??"),
                  TextButton(
                    onPressed: () {
                      // Navigate to Sign Up page
                      Get.to(() => ForgotPasswordPage());
                    },
                    child: Text(
                      'Click Here',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.Violet100),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.Violet100,
                      minimumSize: Size(343, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => HomePage());
                      // Implement login functionality
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: AppColors.Light100,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter'),
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account yet?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to Sign Up page
                      Get.to(() => SignupScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.Violet100),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 343,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.Light20),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/magicons/google.png'),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Dark50),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
