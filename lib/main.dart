import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/bottom_nav_bar.dart';
import 'package:montra_expense_tracker/utils/app_color.dart';
import 'package:montra_expense_tracker/widgets/my_widgets.dart';

void main() {
  Client client = Client();

  client
      .setEndpoint(
          'https://[YOUR_APPWRITE_ENDPOINT]/v1') // Your Appwrite Endpoint
      .setProject('[YOUR_PROJECT_ID]'); // Your project ID

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final Client client;

  MyApp({required this.client});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Appwrite Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBarView(),
    );
  }
}
