// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
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
var Num = 0;
  var UserData = {};
class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
        getdata() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final DocumentSnapshot snapshot =
          await firestore.collection("users").doc(widget.UserData['UID']).get();
      final data = snapshot.data();
      setState(() {
        UserData = data;
      });
    }

    if (Num == 0) {
      getdata();
      setState(() {
        Num = 1;
      });
    }
    if (kDebugMode) {
      print({
        "Deposit Page",
        "${ UserData}"
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

