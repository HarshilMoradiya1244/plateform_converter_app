import 'package:flutter/cupertino.dart';

class SplashScreenios extends StatefulWidget {
  const SplashScreenios({super.key});

  @override
  State<SplashScreenios> createState() => _SplashScreeniosState();
}

class _SplashScreeniosState extends State<SplashScreenios> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'dash');
    });
    return CupertinoPageScaffold(backgroundColor:CupertinoColors.white,child:
         Center(
          child: Image.asset(
            "assets/images/ios_image.png",
            height: 100,
          ),
        ),
      );
  }
}