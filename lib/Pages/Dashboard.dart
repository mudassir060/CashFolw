// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String? Name;
  final String? Email;
  final String? UID;
  final String? PhoneNo;
  const Dashboard({Key? key, this.Name, this.Email, this.PhoneNo, this.UID})
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("Available_Balance");
                },
                child: const Card(
                    titel: "Available_Balance",
                    icon_Data: Icons.account_balance_outlined,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL EARN POINT");
                },
                child: const Card(
                    titel: "TOTAL EARN POINT",
                    icon_Data: Icons.price_change,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("Panding Balance");
                },
                child: const Card(
                    titel: "Panding Balance",
                    icon_Data: Icons.account_balance,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL CLICK");
                },
                child: const Card(
                    titel: "TOTAL CLICK",
                    icon_Data: Icons.collections_bookmark,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("REMAIN TODAY CLICK");
                },
                child: const Card(
                    titel: "REMAIN TODAY CLICK",
                    icon_Data: Icons.price_change,
                    No: "340"),
              ),
              _space
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
            height: vwidth / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
                Icon(
                  widget.icon_Data,
                  size: vwidth / 3,
                ),
                Text(
                  widget.titel,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$ ${widget.No}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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

Widget get _space => const SizedBox(
      height: 10,
    );
