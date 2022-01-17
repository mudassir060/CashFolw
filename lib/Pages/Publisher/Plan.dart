// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   _space,
                const Card(
                  Price: '5',
                  titel: "Basic Plan",
                  No: "340",
                  Daily_Limit: '100',
                  Validite: '5',
                ),
                              _space,
                const Card(
                  Price: '15',
                  titel: "Mediam Plan",
                  No: "640",
                  Daily_Limit: '200',
                  Validite: '10',
                ),
                _space,
                const Card(
                  Price: '25',
                  titel: "Subscribe Plan",
                  No: "840",
                  Daily_Limit: '300',
                  Validite: '15',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final String Price;
  final String titel;
  final String Daily_Limit;
  final String Validite;
  final String No;

  const Card(
      {Key? key,
      required this.titel,
      required this.No,
      required this.Daily_Limit,
      required this.Validite,
      required this.Price})
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "${widget.titel}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: vwidth / 1.5,
                    color: Colors.white,
                  ),
                  Text(
                    "${widget.Price} \$",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: vhight/3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
                  _Line,
                  Text("Daily Limit : ${widget.Daily_Limit} PTC"),
                  _Line,
                  Text("Validity : ${widget.Validite} Day"),
                  _Line,
                  Text("Points: ${widget.No}"),
                  _Line,
                  Container(
                    height: vhight / 11,
                    width: vwidth - 30,
                    child: const Center(
                      child: Text(
                        "Subscribe",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
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

Widget get _space => const SizedBox(
      height: 30,
    );
Widget get _Line => const DottedLine(
      dashLength: 0.5,
    );