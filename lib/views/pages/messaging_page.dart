import 'package:flutter/material.dart';

class MessagingPage extends StatelessWidget {
  final String email;
  const MessagingPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      /*body: Column(
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
        ),*/
    );
  }
}