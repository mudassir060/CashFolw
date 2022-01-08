// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const Dashboard(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Dashboard Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dashboard",
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
          child: Column(
            children: [
              const Card(
                  titel: "Available_Balance",
                  icon_Data: Icons.price_change,
                  No: "340"),
              const Card(
                  titel: "Panding Balance",
                  icon_Data: Icons.price_change,
                  No: "340"),
              const Card(
                  titel: "Total Point",
                  icon_Data: Icons.price_change,
                  No: "340"),
              const Card(
                  titel: "Daily Ads", icon_Data: Icons.price_change, No: "340"),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final IconData icon_Data;
  final String titel;
  final String No;

  const Card(
      {Key? key,
      required this.titel,
      required this.icon_Data,
      required this.No})
      : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Container(
            width: vwidth - 15,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
                SizedBox(
                  width: 50,
                  child: Icon(widget.icon_Data),
                ),
                SizedBox(
                  width: vwidth / 2,
                  child: Text(widget.titel),
                ),
                SizedBox(
                  width: 70,
                  child: Text("\$ ${widget.No}"),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            )),
      ),
    );
  }
}
