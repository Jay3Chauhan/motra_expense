import 'package:flutter/material.dart';
import 'package:montra_expense_tracker/views/Expense_new_screen.dart';
import 'package:montra_expense_tracker/views/Income_new_screen.dart';
import 'package:montra_expense_tracker/views/Transfer_new_screen.dart';
import 'package:montra_expense_tracker/views/home_screen.dart';
import 'package:montra_expense_tracker/views/onbordingscreens/signup_screen.dart';
import 'package:montra_expense_tracker/views/profile_screen.dart';
import 'package:montra_expense_tracker/views/transactions_screen.dart';

class BottomBarView extends StatefulWidget {
  BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int currentIndex = 0;
  bool isAddButtonClicked = false;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      isAddButtonClicked = index == 2; // Assuming the add button is at index 2
    });
  }

  List<Widget> widgetOption = [
    HomePage(),
    TransactionsScreen(),
    HomePage(),
    ProfileScreen(),
    SignupScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            widgetOption[currentIndex],
            if (isAddButtonClicked)
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 50,
                bottom: 30, // adjust values according to your need
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewExpense()),
                          );
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewIncomeScreen()),
                              );
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewTransferScreen()),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Transaction'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
