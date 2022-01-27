// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Widget/Color.dart';
import 'package:intl/intl.dart';

class Withdraw extends StatefulWidget {
  final Map UserData;

  const Withdraw({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

final TextEditingController AmountController = TextEditingController();
final TextEditingController EmailController = TextEditingController();
final TextEditingController PinController = TextEditingController();
var Num = 0;
var UserData = {};

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
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
      print({"Withdraw Page", "${UserData}"});
    }
    Withdraw() async {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DateTime now = DateTime.now();
        String formattedDate =
            DateFormat('yyyyy.MMMMM.dd GGG hh:mm aaa').format(now);
        await firestore
            .collection("Panding Withdraw")
            .doc(formattedDate + UserData["UID"])
            .set({
          "username": UserData["username"],
          "email": EmailController.text,
          "PhoneNo": UserData["PhoneNo"],
          "Available_Balance": UserData["Available_Balance"],
          "UID": UserData["UID"],
          "Date": formattedDate,
          "Payment ID": PinController.text,
          "Del": formattedDate + UserData["UID"],
          "Amount": int.parse(AmountController.text),
        });
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // dismiss dialog
          },
        );
        AlertDialog alert = AlertDialog(
          title: Center(child: Text("Done")),
          // content: Text("Done"),
          // actions: [
          //   okButton,
          // ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      } catch (e) {
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // dismiss dialog
          },
        );
        AlertDialog alert = AlertDialog(
          title: Center(child: Text("Error")),
          content: Text("${e.toString()}"),
          // actions: [
          //   okButton,
          // ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Withdraw",
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
        body: SingleChildScrollView(
          child: Container(
            height: vhight,
            width: vwidth,
            child: Center(
              child: Container(
                width: 320,
                height: 410,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Fund Withdrawal",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _space,
                    Container(
                      width: 400,
                      height: 350,
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            children: [
                              const Text(
                                "Get Your Fund To your account",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              _space,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Enter Withdraw Amount",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextField(
                                    controller: AmountController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        hintText:
                                            "Enter amount that you want withdraw"),
                                  ),
                                  _space,
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Email ID",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextField(
                                    controller: EmailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      hintText: "abc@gmail.com",
                                    ),
                                  ),
                                  _space,
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Account Number",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextField(
                                    controller: PinController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        hintText: "JazzCash No"),
                                  ),
                                  _space,
                                  Center(
                                    child: ElevatedButton(
                                        child: const Text(
                                          'Withdraw Now!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        onPressed: Withdraw,
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        )))),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.purple,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget get _space => const SizedBox(
      height: 10,
    );
