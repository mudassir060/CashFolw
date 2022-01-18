// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

class Referral extends StatefulWidget {
  final Map UserData;
  const Referral({Key? key, required this.UserData}) : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({"Referral Page", "${widget.UserData}"});
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Full Levels Status",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const Text(
                  "Check your downline team",
                ),
                RefCard(
                  LevelNo: "Level 1 Direct Referral",
                  UserData: widget.UserData,
                ),
                SizedBox(
                  height: 9,
                ),
                RefCard(
                  LevelNo: "Level 2 IN Direct Referral",
                  UserData: widget.UserData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RefCard extends StatefulWidget {
  final String LevelNo;
  final Map UserData;

  const RefCard({Key? key, required this.LevelNo, required this.UserData})
      : super(key: key);

  @override
  _RefCardState createState() => _RefCardState();
}

class _RefCardState extends State<RefCard> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
        .collection('${widget.UserData['Referral']}')
        .orderBy('Referral', descending: false)
        .snapshots();

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Container(
            width: vwidth - 15,
            // height: vwidth / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: vwidth - 15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.LevelNo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                // // // // // // // // // heading Row  // // // // // // // // //
                Container(
                  width: vwidth - 15,
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        child: const Center(
                          child: Text(
                            "#",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: const Center(
                          child: Text(
                            "Referral",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: const Center(
                          child: Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // // // // // // // // // List Row  // // // // // // // // //
                Center(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _PlanStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var vwidth = MediaQuery.of(context).size.width;
                      var vhight = MediaQuery.of(context).size.height;
                      var Index = 0;
                      return SizedBox(
                        height: vhight,
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          controller: ScrollController(),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            Index++;
                            return RefRow(
                              No: Index,
                              ID: '${data['Referral']}',
                              Name: '${data['username']}',
                              Number: '${data['PhoneNo']}',
                              vwidth: vwidth,
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 5)
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
            )),
      ),
    );
  }
}

class RefRow extends StatelessWidget {
  var No;
  final String ID;
  final String Name;
  final String Number;
  var vwidth;
  RefRow(
      {Key? key,
      required this.No,
      required this.ID,
      required this.Name,
      required this.Number,
      required this.vwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colr = No % 2;

    return Container(
      color: colr == 1 ? Colors.black12 : Colors.black26,
      width: vwidth - 15,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  "$No",
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  ID,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  Name,
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: Text(
                  Number,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
