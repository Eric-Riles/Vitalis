import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 550,
                
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 10,
                children: [
                  Flexible(
                    child: TextField(
                      controller: textController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    )
                  ),
                  GestureDetector(
                    onTap: () => textController.text != '' ? print(textController.text) : setState(() {}),
                    child: Container(
                      width: 60,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: Icon(CupertinoIcons.location_fill, color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}