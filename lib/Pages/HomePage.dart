// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const HomePage(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      if (kDebugMode) {
        print({"Home Page",widget.Name, widget.Email, widget.PhoneNo,});
      }
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
