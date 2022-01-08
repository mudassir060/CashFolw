// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const Plan(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);

  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Plan Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Plan",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Plan",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Card(
                  titel: "Available_Balance",
                  icon_Data: Icons.price_change,
                  No: "340"),
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
    return Container(
        width: vwidth - 30,
        height: vhight - 250,
        child: Column(
          children: [
            Container(
              height: vhight / 3.5,
              width: vwidth - 30,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Create Plan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: vwidth / 1.5,
                    color: Colors.white,
                  ),
                  const Text(
                    "500 \$",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
                SizedBox(
                  width: vwidth / 2,
                  child: Text(widget.titel),
                ),
                SizedBox(
                  width: 50,
                  child: Icon(widget.icon_Data),
                ),
                SizedBox(
                  width: 70,
                  child: Text("\$ ${widget.No}"),
                ),
              ],
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
        ));
  }
}
