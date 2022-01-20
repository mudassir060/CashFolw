// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Bloc/AppBar.dart';
import 'package:ppc/Pages/Publisher/Deposit.dart';
import 'package:ppc/Pages/Publisher/Plan.dart';
import 'package:ppc/Pages/Publisher/PostAd.dart';
import 'package:ppc/Pages/Viewer/InviteFriend.dart';
import 'package:ppc/Pages/Viewer/Referral.dart';
import 'package:ppc/Pages/Viewer/ViewAd.dart';
import 'package:ppc/Pages/Viewer/Withdraw.dart';
import 'package:ppc/Widget/Color.dart';

class HomePage extends StatefulWidget {
  final Map UserData;

  const HomePage({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({"Home Page", "${widget.UserData}"});
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: GridView.count(
          primary: false,
          crossAxisCount: 3,
          padding: const EdgeInsets.all(6),
          childAspectRatio: (1 / 1.3),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: "images/Icon/post ads.png",
                titel: "Place ad"),
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: "images/Icon/deposit.png",
                titel: "Deposit"),
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: "images/Icon/withdrawal.png",
                titel: "Withdraw"),
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: "images/Icon/plans.png",
                titel: "Plan"),
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: "images/Icon/referals.png",
                titel: "Referral"),
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: "images/Icon/view ads.png",
                titel: "ADS View"),
            Grid_Card(
                UserData: widget.UserData,
                icon_Data: 'images/Icon/add-friend.png',
                titel: "Invite Friend"),
          ],
        ),
      ),
    );
  }
}

class Grid_Card extends StatelessWidget {
  final Map UserData;
  final String icon_Data;
  final String titel;
  const Grid_Card({
    Key? key,
    required this.icon_Data,
    required this.titel,
    required this.UserData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (titel == "Place ad") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostAd(UserData: UserData),
            ),
          );
        }
        if (titel == "Deposit") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Deposit(UserData: UserData),
            ),
          );
        }
        if (titel == "Withdraw") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Withdraw(UserData: UserData),
            ),
          );
        }
        if (titel == "Plan") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Plan(
                UserData: UserData,
                Admin: false,
              ),
            ),
          );
        }
        if (titel == "Referral") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Referral(UserData: UserData)),
          );
        }
        if (titel == "ADS View") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewAd(UserData: UserData),
            ),
          );
        }
        if (titel == "Invite Friend") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const InviteFriend(),
            ),
          );
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
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(icon_Data),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
              ),
              Text(
                titel,
                style: const TextStyle(fontWeight: FontWeight.bold),
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
