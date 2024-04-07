import 'package:flutter/material.dart';
import 'ChangePassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SettingPage(),
        '/SettingPage': (context) => const SettingPage(),
        '/ChangePasswordPage': (context) => const ChangePasswordPage()
      },
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Coach',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFDE59),
                      ),
                    ),
                    Text(
                      'Cook',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.lock,
              size: 36, // Adjust the icon size
            ),
            title: Text(
              'Change Password',
              style: TextStyle(fontSize: 20), // Adjust the text size
            ),
            onTap: () {
              // Navigate to change password page
              Navigator.pushNamed(context, '/ChangePasswordPage');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 36, // Adjust the icon size
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 20), // Adjust the text size
            ),
            onTap: () {
              // Perform log out action
              // For example, you can clear user session and navigate to login page
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

