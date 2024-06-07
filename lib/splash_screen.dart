import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_streaming/join_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
     Timer(Duration(seconds: 3), () {
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => JoinScreen(),
        ),
      );
    });
   return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/icon.png',height: 60,width: 60,))
      ],
    );
  }
}