// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

class Deposit extends StatefulWidget {
  final String? Name;
  final String? Email;
  final String? UID;
  final String? PhoneNo;
  const Deposit({Key? key, this.Name, this.Email, this.PhoneNo, this.UID})
      : super(key: key);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Deposit Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Deposit",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Text("Deposit"),
            ],),
          ),
        ),
      ),
    );
  }
}

