import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/views/login_screen.dart';

import '../../utils/app_color.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Reset Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextFormField(
              obscuringCharacter: '*',
              obscureText: true,
              controller: newPasswordController,
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
                  return 'Please enter a new password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              obscuringCharacter: '*',
              obscureText: true,
              controller: retypePasswordController,
              decoration: InputDecoration(
                  //contentPadding: EdgeInsets.only(top: 20, left: 20),
                  errorStyle: TextStyle(fontSize: 0),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.Light20,
                  ),
                  hintText: "Retype New Password",
                  focusColor: AppColors.Violet100,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.Violet100, width: 1.5),
                      borderRadius: BorderRadius.circular(16.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please retype the new password';
                } else if (value != newPasswordController.text) {
                  return 'Passwords do not match';
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
                  if (newPasswordController.text.isNotEmpty &&
                      retypePasswordController.text.isNotEmpty &&
                      newPasswordController.text ==
                          retypePasswordController.text) {
                    // Reset password logic here
                    Get.to(() => LoginPage());
                    Get.snackbar('Success', 'Password reset successfully',
                        colorText: AppColors.Light100,
                        backgroundColor: AppColors.Violet100);
                  } else {
                    Get.snackbar('Error', 'Passwords do not match',
                        colorText: AppColors.Light100,
                        backgroundColor: AppColors.Violet100);
                  }

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
