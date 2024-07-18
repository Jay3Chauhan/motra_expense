import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/utils/app_color.dart';
import 'package:montra_expense_tracker/views/login_screen.dart';
import 'package:montra_expense_tracker/views/onbordingscreens/resetpassword_screen.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Don’t worry.',
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.Violet100,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              'Enter your email and we’ll send you a link to reset your password.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30),
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.Violet100,
                  minimumSize: Size(343, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Get.to(() => EmailSentPage(email: emailController.text));
                  // Implement login functionality
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: AppColors.Light100,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'inter'),
                )),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate and display the image
            //     Get.to(() => EmailSentPage(email: emailController.text));
            //   },
            //   child: Text('Continue'),
            // ),
          ],
        ),
      ),
    );
  }
}

class EmailSentPage extends StatelessWidget {
  final String email;

  EmailSentPage({required this.email});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/Youremail.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'Your email is on the way',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Check your email $email and follow the instructions to reset your password.',
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.Violet100,
                  minimumSize: Size(343, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Get.to(() => ResetPasswordPage());
                  // Implement login functionality
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: AppColors.Light100,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'inter'),
                )),
          ],
        ),
      ),
    );
  }
}
