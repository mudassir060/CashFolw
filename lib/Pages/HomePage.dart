// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const HomePage(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Home Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Page",
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      // ),
      home: Scaffold(
        body: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200.0,
          children: const [
            Grid_Card(icon_Data: Icons.dashboard, titel: "Dashboard"),
            Grid_Card(icon_Data: Icons.payment, titel: "Deposit"),
            Grid_Card(icon_Data: Icons.money, titel: "Withdraw"),
            Grid_Card(icon_Data: Icons.help, titel: "Plan"),
            Grid_Card(icon_Data: Icons.refresh, titel: "Referral"),
            // Grid_Card(icon_Data: Icons.dashboard, titel: "Transaction"),
            Grid_Card(icon_Data: Icons.ad_units, titel: "ADS View"),
          ],
        ),
      ),
    );
  }
}

class Grid_Card extends StatelessWidget {
  final IconData icon_Data;
  final String titel;
  const Grid_Card({
    Key? key,
    required this.icon_Data,
    required this.titel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (titel == "Dashboard") {
          print(titel);
        }
                if (titel == "Deposit") {
          print(titel);
        }
                if (titel == "Withdraw") {
          print(titel);
        }
                if (titel == "Plan") {
          print(titel);
        }
                if (titel == "Referral") {
          print(titel);
        }
             if (titel == "ADS View") {
          print(titel);
        }
        
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
              Icon(
                icon_Data,
                size: 100,
                color: Colors.purple,
              ),
              Text(
                titel,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
            ),
      ),
    );
  }
}
