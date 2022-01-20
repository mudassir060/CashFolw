// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';
import 'package:ppc/Widget/Color.dart';

class Deposit extends StatefulWidget {
  final Map UserData;

  const Deposit({Key? key, required this.UserData,})
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
        "${widget.UserData}"
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Deposit",
      theme: ThemeData(
          primarySwatch: kToDark,
      ),
      home: Scaffold(
                         appBar: AppBar(
            title: const Text(
                  "Deposit",
                  style: TextStyle(color: Colors.white),
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
              Text("Deposit"),
            ],),
          ),
        ),
      ),
    );
  }
}

