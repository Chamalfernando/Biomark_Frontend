import 'dart:async';

import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacementNamed(
        context,
        '/login',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: splashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/BioMark.png',
              ),
            ),
            boxSIZED_10,
            Text(
              "B I O M A R K",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 16,
                color: black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
