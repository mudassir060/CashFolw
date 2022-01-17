// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Function/deletePlan.dart';
import 'package:ppc/Pages/Admin/Create_Plan.dart';

class Plan extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  late bool Admin;
  Plan(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.Admin,
      required this.UID})
      : super(key: key);

  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
      .collection('Plans')
      .orderBy('_Price', descending: false)
      .snapshots();

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
                    widget.Admin
                        ? ElevatedButton(
                            child: const Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: Text(
                                'Create Plan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Create_Plan(),
                                ),
                              );
                            },
                          )
                        : Center(),
                    SizedBox(
                      height: vhight-120,
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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
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
              IconButton(
                  onPressed: () {
                    deletePlan(context, widget.Date);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 34,
                    color: Colors.red,
                  )),
            ],
          ),
          Container(
            height: vhight / 3,
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
    );
  }
}

Widget get _space => const SizedBox(
      height: 30,
    );
Widget get _Line => const DottedLine(
      dashLength: 0.5,
    );
