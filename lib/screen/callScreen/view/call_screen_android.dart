import 'package:flutter/material.dart';

class CallScreenAndroid extends StatefulWidget {
  const CallScreenAndroid({super.key});

  @override
  State<CallScreenAndroid> createState() => _CallScreenAndroidState();
}

class _CallScreenAndroidState extends State<CallScreenAndroid> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Call Send")
          ],
        ),
      ),
    );
  }
}
