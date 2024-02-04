import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
              'Welcome to Montra Expense Tracker',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'This is the home page of the app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
