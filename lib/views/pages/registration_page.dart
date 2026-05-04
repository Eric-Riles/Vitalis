import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_application_1/views/widget_tree.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Text(
                  'Vitalis',
                  style: TextStyle(
                    fontSize: 30
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: TextField(  
                    autocorrect: false,
                    controller: user,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hint: Text(
                        'Email',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: TextField(
                    autocorrect: false,
                    obscureText: true,
                    controller: pass,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hint: Text(
                        'Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    bool worked = await AuthServices().singup(email: user.text, password: pass.text);
                    if(worked){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return WidgetTree();}));
                    }
                  },
                  child: Text('Register')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}