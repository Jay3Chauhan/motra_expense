import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: 'Month',
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String? newValue) {},
              items: <String>['Month', 'Week', 'Day']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'See your financial report',
                style: TextStyle(color: Colors.purple),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SectionHeader(title: 'Today'),
                  TransactionItem(
                    icon: Icons.shopping_basket,
                    iconColor: Colors.orange,
                    title: 'Shopping',
                    subtitle: 'Buy some grocery',
                    amount: '- \$120',
                    amountColor: Colors.red,
                    time: '10:00 AM',
                  ),
                  TransactionItem(
                    icon: Icons.subscriptions,
                    iconColor: Colors.purple,
                    title: 'Subscription',
                    subtitle: 'Disney+ Annual..',
                    amount: '- \$80',
                    amountColor: Colors.red,
                    time: '03:30 PM',
                  ),
                  TransactionItem(
                    icon: Icons.fastfood,
                    iconColor: Colors.red,
                    title: 'Food',
                    subtitle: 'Buy a ramen',
                    amount: '- \$32',
                    amountColor: Colors.red,
                    time: '07:30 PM',
                  ),
                  SectionHeader(title: 'Yesterday'),
                  TransactionItem(
                    icon: Icons.attach_money,
                    iconColor: Colors.green,
                    title: 'Salary',
                    subtitle: 'Salary for July',
                    amount: '+ \$5000',
                    amountColor: Colors.green,
                    time: '04:30 PM',
                  ),
                  TransactionItem(
                    icon: Icons.directions_car,
                    iconColor: Colors.blue,
                    title: 'Transportation',
                    subtitle: 'Charging Tesla',
                    amount: '- \$18',
                    amountColor: Colors.red,
                    time: '08:30 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Colors.purple,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String time;

  TransactionItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(amount, style: TextStyle(color: amountColor)),
            Text(time, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: TransactionsScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ));
