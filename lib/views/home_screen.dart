import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPeriod = 'Today';
  double accountBalance = 9400;
  double income = 5000;
  double expenses = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 20),
                _buildBalanceSection(),
                SizedBox(height: 20),
                _buildSpendFrequency(),
                SizedBox(height: 20),
                _buildRecentTransactionsHeader(),
                SizedBox(height: 10),
                _buildRecentTransactionsList(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/ExportData.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('October',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        Icon(Icons.notifications, color: Colors.purple),
      ],
    );
  }

  Widget _buildBalanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Account Balance',
            style: TextStyle(fontSize: 18, color: Colors.grey)),
        SizedBox(height: 5),
        Text('\$${accountBalance.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIncomeExpenseCard(
                'Income', '\$${income.toStringAsFixed(0)}', Colors.green),
            _buildIncomeExpenseCard(
                'Expenses', '\$${expenses.toStringAsFixed(0)}', Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _buildIncomeExpenseCard(String title, String amount, Color color) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 18, color: color)),
          SizedBox(height: 5),
          Text(amount,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildSpendFrequency() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Spend Frequency',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: _buildChart(),
        ),
      ],
    );
  }

  Widget _buildChart() {
    // Placeholder for chart. Replace with actual chart widget.
    return charts.LineChart(
      _createSampleData(),
      animate: true,
    );
  }

  List<charts.Series<dynamic, num>> _createSampleData() {
    final data = [
      _ChartData(0, 5),
      _ChartData(1, 25),
      _ChartData(2, 100),
      _ChartData(3, 75),
    ];

    return [
      charts.Series<_ChartData, int>(
        id: 'SpendFrequency',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (_ChartData sales, _) => sales.time,
        measureFn: (_ChartData sales, _) => sales.amount,
        data: data,
      )
    ];
  }

  Widget _buildRecentTransactionsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recent Transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('See All', style: TextStyle(fontSize: 16, color: Colors.purple)),
      ],
    );
  }

  Widget _buildRecentTransactionsList() {
    return Column(
      children: [
        _buildTransactionTile('Shopping', 'Buy some grocery', '- \$120',
            '10:00 AM', Colors.orange),
        _buildTransactionTile('Subscription', 'Disney+ Annual..', '- \$80',
            '03:30 PM', Colors.purple),
        _buildTransactionTile(
            'Food', 'Buy a ramen', '- \$32', '07:30 PM', Colors.red),
        _buildTransactionTile(
            'Food', 'Buy a ramen', '- \$32', '07:30 PM', Colors.red),
      ],
    );
  }

  Widget _buildTransactionTile(
      String title, String subtitle, String amount, String time, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(Icons.shopping_cart, color: color),
      ),
      title: Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  int _currentIndex = 0;
  bool _isAddButtonClicked = false;

  Widget _buildBottomNavigationBar() {
    return Stack(
      children: <Widget>[
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _isAddButtonClicked =
                  index == 2; // Assuming the add button is at index 2
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz), label: 'Transaction'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, size: 40), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart), label: 'Budget'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        if (_isAddButtonClicked)
          Positioned(
            bottom: 50, // adjust values according to your need
            child: Column(
              children: <Widget>[
                FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
                FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
                FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
      ],
    );
  }
}

class _ChartData {
  final int time;
  final int amount;

  _ChartData(this.time, this.amount);
}

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));
