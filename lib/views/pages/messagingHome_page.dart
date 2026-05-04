import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_application_1/services/chat_services.dart';
import 'package:flutter_application_1/views/pages/messaging_page.dart';
import 'package:flutter_application_1/widgets/userTile_widget.dart';

class MessagingHomePage extends StatefulWidget {
  const MessagingHomePage({super.key});

  @override
  State<MessagingHomePage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingHomePage> {
  final ChatServices _chat = ChatServices();
  final AuthServices _auth = AuthServices();

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildUserList(),
      )
    );
  }
  
  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chat.getUsersStream(), 
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Text('Error');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => 
          _buildUserItem(userData, context)).toList(),
        );
      }
    );
  }
  
  Widget _buildUserItem(Map<String, dynamic> userData, BuildContext context) {
    if(userData['email'] != 'w'){
      return UserTileWidget(
        text: userData['email'],
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {return MessagingPage(email: userData['email'],);}));
        },
      );
    }
    return Container();
  }
}