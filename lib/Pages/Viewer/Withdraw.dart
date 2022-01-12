// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

class Withdraw extends StatefulWidget {
  final String? Name;
  final String? Email;
  final String? UID;
  final String? PhoneNo;
  const Withdraw({Key? key, this.Name, this.Email, this.PhoneNo, this.UID})
      : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Withdraw Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Withdraw",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Withdraw",
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
        ),
      
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Text("Withdraw"),
            ],),
          ),
        ),
      ),
    );
  }
}

