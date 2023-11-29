import 'package:flutter/material.dart';

class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({super.key});

  @override
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Chat",style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
