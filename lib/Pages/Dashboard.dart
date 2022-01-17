// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

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
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Dashboard Page",
        "${widget.UserData}"
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
                child: Cards(
                    titel: "Available_Balance",
                    icon_Data: Icons.account_balance_outlined,
                    No: "${widget.UserData["Available_Balance"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL EARN POINT");
                },
                child: Cards(
                    titel: "TOTAL EARN POINT",
                    icon_Data: Icons.price_change,
                    No: "${widget.UserData["Total Point"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("Panding Balance");
                },
                child: Cards(
                    titel: "Panding Balance",
                    icon_Data: Icons.account_balance,
                    No: "${widget.UserData["Panding Balance"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("TOTAL CLICK");
                },
                child: Cards(
                    titel: "TOTAL CLICK",
                    icon_Data: Icons.collections_bookmark,
                    No: "${widget.UserData["Total Click"]}"),
              ),
              GestureDetector(
                onTap: () {
                  print("REMAIN TODAY CLICK");
                },
                child: Cards(
                    titel: "REMAIN TODAY CLICK",
                    icon_Data: Icons.price_change,
                    No: "${widget.UserData["Remain Today Click"]}"),
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
