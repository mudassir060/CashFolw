// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';
import 'package:ppc/Widget/Color.dart';
import 'package:ppc/Widget/PieChart.dart';

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
  var Num = 0;
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

    print("==========1============>$Num");
    if (Num == 0) {
      getdata();
      setState(() {
        Num = 1;
      });
      print("==========2============>$Num");
    }
    if (kDebugMode) {
      print({"Dashboard Page", "${UserData}"});
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
        body: SingleChildScrollView(
          child: Column(
            children: [
               
              GestureDetector(
                onTap: () {
                  print("Available_Balance");
                },
                child: Cards(
                    titel: "Available Balance",
                    Color_s: Colors.blue,
                    icon_Data: 'images/Icon/Available Balance.png',
                    No: "${UserData["Available_Balance"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL EARN POINT");
                },
                child: Cards(
                    titel: "TOTAL EARN POINT",
                    Color_s: Colors.orange,
                    icon_Data: 'images/Icon/earn point.png',
                    No: "${UserData["Total Point"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("Panding Balance");
                },
                child: Cards(
                    titel: "Panding Balance",
                    Color_s: Colors.pink,
                    icon_Data: 'images/Icon/Panding Balance.png',
                    No: "${UserData["Panding Balance"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL CLICK");
                },
                child: Cards(
                    titel: "TOTAL CLICK",
                    Color_s: Colors.indigo,
                    icon_Data: "images/Icon/total clicks.png",
                    No: "${UserData["Total Click"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("REMAIN TODAY CLICK");
                },
                child: Cards(
                    titel: "REMAIN TODAY CLICK",
                    Color_s: Colors.teal,
                    icon_Data: 'images/Icon/remaining point.png',
                    No: "${UserData["Remain Today Click"]}"),
              ),
              _space,
                Pie_Chart(
                  AvailableBalance: "${UserData["Available_Balance"]}",
                  TOTALEARNPOINT: "${UserData["Total Point"]}",
                  PandingBalance: "${UserData["Panding Balance"]}",
                  TOTALCLICK: "${UserData["Total Click"]}",
                  REMAINTODAYCLICK: "${UserData["Remain Today Click"]}"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget get _space => const SizedBox(
      height: 10,
);
