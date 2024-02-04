import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/utils/app_color.dart';
import 'package:montra_expense_tracker/views/login_screen.dart';
import 'package:montra_expense_tracker/views/onbordingscreens/signup_screen.dart';
import 'package:montra_expense_tracker/widgets/my_widgets.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  height: 310.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: [
                  Container(
                    child: Image.asset(
                      'assets/Onbording_money.png',
                      height: 310,
                      width: 310,
                    ),

                    //Text("Onbording Screen"),

                    //padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/Variantmoney.png',
                      height: 310,
                      width: 310,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/VariantPlanning.png',
                      height: 310,
                      width: 310,
                    ),
                  ),
                ]),
            SizedBox(height: 50),
            CarouselSlider(
              items: [
                Container(
                  width: 320,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Gain total control of your money",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Become your own money manager and make every cent count",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'inter',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Know where your money goes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Track your transaction easily, with categories and financial report ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'inter',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Planning ahead",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Setup your budget for each category so you in control",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 170,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  myelevatedButton(
                    text: "Sign Up",
                    onPressed: () => Get.to(() => SignupScreen()),
                    color: AppColors.Violet100,
                    textColor: AppColors.Light80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  myelevatedButton(
                    text: "Login",
                    onPressed: () => {
                      Get.to(() => LoginPage()),
                    },
                    color: AppColors.Violet20,
                    textColor: AppColors.Violet100,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
