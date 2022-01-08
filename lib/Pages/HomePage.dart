// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, String? UID, String? Name, String? Email, String? PhoneNo})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("");
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Page",
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      // ),
      home: Scaffold(
        body: Center(
          child: Text("Pakistan"),
        ),
      ),
    );
  }
}
