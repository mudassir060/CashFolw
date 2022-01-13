// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

class Referral extends StatefulWidget {
  final String? Name;
  final String? Email;
  final String? UID;
  final String? PhoneNo;
  const Referral({Key? key, this.Name, this.Email, this.PhoneNo, this.UID})
      : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Referral Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Text("Referral"),
            ],),
          ),
        ),
      ),
    );
  }
}

