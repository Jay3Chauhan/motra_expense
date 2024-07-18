import 'package:flutter/material.dart';

import 'package:montra_expense_tracker/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/views/onbordingscreens/emailverification_screen.dart';
import 'package:montra_expense_tracker/views/onbordingscreens/onbording_screen.dart';
import 'package:montra_expense_tracker/widgets/my_widgets.dart';

import 'verification_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

bool isChecked = false;

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.to(() => OnbordingScreen());
            },
          ),
          title: Text("Sign Up "),
          foregroundColor: AppColors.Dark50,
          actionsIconTheme: IconThemeData(color: AppColors.Dark50),
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: myTextField(
                controller: nameController,
                text: "Name",
                bool: false,
                // controller: null,
                validator: (input) {}),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: myTextField(
                controller: emailController,
                text: "Email",
                bool: false,
                // controller: null,
                validator: (input) {}),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: myTextField(
                controller: passwordController,
                text: "Password",
                bool: true,

                // controller: null,
                validator: (input) {}),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Checkbox(
                  splashRadius: 12,
                  fillColor: MaterialStateProperty.all(AppColors.Violet100),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
              Text("By signing up, you agree to,"),
              InkWell(
                onTap: () {},
                child: Text(
                  "Terms & Privacy",
                  style: TextStyle(color: AppColors.Violet100),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          myelevatedButton(
              text: "Sign Up",
              onPressed: () {},
              textColor: AppColors.Light100,
              color: AppColors.Violet100),
          SizedBox(height: 20),
          Text(
            "Or With",
            style:
                TextStyle(color: AppColors.Dark50, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Container(
              width: 343,
              height: 70,
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
                    "Sign Up with Google",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Dark50),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have a Account?",
                    style: TextStyle(
                        color: AppColors.Light20,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "  Login",
                    style: TextStyle(
                        color: AppColors.Violet100,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
