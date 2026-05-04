import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_application_1/views/pages/login_page.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () async {
                await AuthServices().logout();
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute(builder: (context) => LoginPage()), 
                (Route<dynamic> route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}