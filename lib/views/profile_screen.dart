import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildProfileInfo(),
              SizedBox(height: 20),
              _buildProfileOptions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/ExportData.png'),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Username', style: TextStyle(fontSize: 18, color: Colors.grey)),
        SizedBox(height: 5),
        Text('Iriana Saliha',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildProfileOption(
            'My Wallet', Icons.account_balance_wallet, Colors.purple),
        _buildProfileOption('Settings', Icons.settings, Colors.purple),
        _buildProfileOption('Export Data', Icons.upload_file, Colors.purple),
        _buildProfileOption('Logout', Icons.logout, Colors.red, onTap: () {
          _showLogoutBottomSheet(context);
        }),
      ],
    );
  }

  Widget _buildProfileOption(String title, IconData icon, Color color,
      {VoidCallback? onTap}) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: TextStyle(fontSize: 18)),
        onTap: onTap ?? () {},
      ),
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Logout?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text('Are you sure do you wanna logout?',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple.withOpacity(0.1),
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No', style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      // Add logout functionality here
                    },
                    child: Text('Yes', style: TextStyle(fontSize: 18)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz), label: 'Transaction'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Budget'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: ProfileScreen(),
    ));
