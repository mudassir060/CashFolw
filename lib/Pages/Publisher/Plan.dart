// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Function/PopUp.dart';
import 'package:ppc/Function/deletePlan.dart';
import 'package:ppc/Pages/Admin/Create_Plan.dart';
import 'package:ppc/Pages/Publisher/Deposit.dart';
import 'package:ppc/Widget/Color.dart';

class Plan extends StatefulWidget {
  final Map UserData;

  Plan({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
      .collection('Plans')
      .orderBy('_Price', descending: false)
      .snapshots();
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

    if (Num == 0) {
      getdata();
      setState(() {
        Num = 1;
      });
    }
    if (kDebugMode) {
      print({"Plan Page", "${UserData}"});
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Plan",
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Plan",
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
          child: Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: _PlanStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var vwidth = MediaQuery.of(context).size.width;
                var vhight = MediaQuery.of(context).size.height;
                return Column(
                  children: [
                    SizedBox(
                      height: vhight - 120,
                      child: ListView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: ScrollController(),
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Card(
                            Price: '${data['_Price']}',
                            titel: "${data['_Titel']}",
                            No: "${data['_Points']}",
                            Daily_Limit: '${data['_Daily_Limit']}',
                            Date: '${data['Date']}',
                            Validite: '${data['_Validite']}',
                            UserData: UserData,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final Map UserData;
  final String Price;
  final String titel;
  final String Daily_Limit;
  final String Validite;
  final String No;
  final String Date;

  Card(
      {Key? key,
      required this.titel,
      required this.No,
      required this.Daily_Limit,
      required this.Validite,
      required this.Date,
      required this.Price,
      required this.UserData})
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
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
          // color: Colors.lightBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: vhight / 4.5,
                  width: vwidth - 30,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                    // color: Colors.lightBlue,
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
              ],
            ),
            Container(
              height: vhight / 3,
              color: Colors.white,
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
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                var Balance = widget.UserData["Available_Balance"] -
                    int.parse(widget.Price);
                var Daily_Ads = widget.UserData["Daily Ads"] +
                    int.parse(widget.Daily_Limit);

                var Total_Point =
                    widget.UserData["Total Point"] + int.parse(widget.No);
                // var Validity =
                //     widget.UserData["Total Point"] - int.parse(widget.Validite);
                var value1 = widget.UserData["Available_Balance"];
                var value2 = int.parse(widget.Price);
                if (value2 <= value1) {
                  await firestore
                      .collection("users")
                      .doc("${widget.UserData["UID"]}")
                      .update({
                    "Available_Balance": Balance,
                    // "Daily Ads": Daily_Ads,
                    "Total Point": Total_Point,
                    "Validity": widget.No,
                  });

                  AlertDialog alert = AlertDialog(
                    // title: Center(child: Text("Error")),
                    content: Text("Done"),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                } else {
                  Widget okButton = TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Deposit(
                                      UserData: UserData,
                                    )),
                          ); // dismiss dialog
                        },
                      );
                      ; // dismiss dialog
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title: Center(child: Text("Error")),
                    content: Text("Account Balance is Low"),
                    actions: [
                      okButton,
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }
              },
              child: Container(
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
                  // color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget get _space => const SizedBox(
      height: 30,
    );
Widget get _Line => const DottedLine(
      dashLength: 0.5,
    );
