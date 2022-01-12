// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

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
        // appBar: AppBar(
        //   title: const Text(
        //     "Dashboard",
        //   ),
        //   centerTitle: true,
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back,
        //       )),
        // ),
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("Available_Balance");
                },
                child: const Cards(
                    titel: "Available_Balance",
                    icon_Data: Icons.account_balance_outlined,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL EARN POINT");
                },
                child: const Cards(
                    titel: "TOTAL EARN POINT",
                    icon_Data: Icons.price_change,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("Panding Balance");
                },
                child: const Cards(
                    titel: "Panding Balance",
                    icon_Data: Icons.account_balance,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL CLICK");
                },
                child: const Cards(
                    titel: "TOTAL CLICK",
                    icon_Data: Icons.collections_bookmark,
                    No: "340"),
              ),
              GestureDetector(
                onTap: () {
                  print("REMAIN TODAY CLICK");
                },
                child: const Cards(
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

Widget get _space => const SizedBox(
      height: 10,
    );
