// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';
import 'package:ppc/Widget/Color.dart';

class Dashboard extends StatefulWidget {
  final Map UserData;
  const Dashboard({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var UserData = {};
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

    // if (Num == "0") {
    //   getdata();
    //   Num = '1' as Type;
    // }
    if (kDebugMode) {
      print({"Dashboard Page", "${widget.UserData}"});
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dashboard",
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
        body: GridView.count(
          primary: false,
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          childAspectRatio: (1 / 1.3),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                print("Available_Balance");
              },
              child: Cards(
                  titel: "Available Balance",
                  icon_Data: 'images/Icon/Available Balance.png',
                  No: "${widget.UserData["Available_Balance"]}"),
            ),
            GestureDetector(
              onTap: () {
                print("TOTAL EARN POINT");
              },
              child: Cards(
                  titel: "TOTAL EARN POINT",
                  icon_Data: 'images/Icon/earn point.png',
                  No: "${widget.UserData["Total Point"]}"),
            ),
            GestureDetector(
              onTap: () {
                print("Panding Balance");
              },
              child: Cards(
                  titel: "Panding Balance",
                  icon_Data: 'images/Icon/Panding Balance.png',
                  No: "${widget.UserData["Panding Balance"]}"),
            ),
            GestureDetector(
              onTap: () {
                print("TOTAL CLICK");
              },
              child: Cards(
                  titel: "TOTAL CLICK",
                  icon_Data: "images/Icon/total clicks.png",
                  No: "${widget.UserData["Total Click"]}"),
            ),
            GestureDetector(
              onTap: () {
                print("REMAIN TODAY CLICK");
              },
              child: Cards(
                  titel: "REMAIN TODAY CLICK",
                  icon_Data: 'images/Icon/remaining point.png',
                  No: "${widget.UserData["Remain Today Click"]}"),
            ),
            _space
          ],
        ),
      ),
    );
  }
}

Widget get _space => const SizedBox(
      height: 10,
    );
