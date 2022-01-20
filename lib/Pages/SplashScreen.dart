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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 200,
            child: Image.asset('images/Logo.png'),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const CircularProgressIndicator(
            color: Color.fromRGBO(117, 48, 251, 1.0),
          )),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const Text(
            "Cash Flow Click Is Loading",
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    ));
  }
}
