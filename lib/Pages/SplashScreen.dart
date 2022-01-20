// ignore_for_file: annotate_overrides, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ppc/Api/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            width: 400,
            height: 200,
            child: Image.asset('images/Logo.png'),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const Text(
            "Cash Flow Is Loading",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
          // ignore: avoid_unnecessary_containers
        Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.blue),
      height: 10,
      width: 10,
    ),
        ],
      ),
    ));
  }
}
