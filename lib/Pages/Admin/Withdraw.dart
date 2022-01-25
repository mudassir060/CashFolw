// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Color.dart';

class WithdrawList extends StatefulWidget {
  const WithdrawList({
    Key? key,
  }) : super(key: key);

  @override
  _WithdrawListState createState() => _WithdrawListState();
}

class _WithdrawListState extends State<WithdrawList> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
        .collection('Plans')
        .orderBy('_Price', descending: false)
        .snapshots();

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "User List",
        //     style: TextStyle(color: Colors.white),
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
          child: Padding(
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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Plans",
                            style: TextStyle(
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
                              width: 100,
                              child: const Center(
                                child: Text(
                                  "Titel",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),                            Container(
                              width: 50,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Day",
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
                                  "Points",
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
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                    Price: '${data['_Price']}',
                                    titel: "${data['_Titel']}",
                                    No: "${data['_Points']}",
                                    Daily_Limit: '${data['_Daily_Limit']}',
                                    Date: '${data['Date']}',
                                    Validite: '${data['_Validite']}',
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

class RefRow extends StatelessWidget {
  final String Price;
  final String titel;
  final String Daily_Limit;
  final String Validite;
  final String No;
  final String Date;
  var vwidth;
  RefRow({
    Key? key,
    required this.No,
    required this.vwidth,
    required this.Price,
    required this.titel,
    required this.Daily_Limit,
    required this.Validite,
    required this.Date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black12 ,
      width: vwidth - 15,
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              child: Text(
                titel,
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  "$Price",
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  "$Daily_Limit",
                ),
              ),
            ),            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  "${No}",
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  deletePlan(context, Date);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 24,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
CollectionReference Plans = FirebaseFirestore.instance.collection('Plans');
Future<void> deletePlan(context, _doc) {
  return Plans.doc(_doc).delete().then((values) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Error")),
      content: Text("Delete Successfully"),
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
  }).catchError((error) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.of(context).pop(); // dismiss dialog
      },
    );
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Error")),
      content: Text("Failed to delete: $error"),
      // actions: [
      //   okButton,
      // ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  });
}
