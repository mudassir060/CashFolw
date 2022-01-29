import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Color.dart';

class Dashboard extends StatefulWidget {
  final Map UserData;
  const Dashboard({Key? key, required this.UserData}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

Map Refer_BY = {};
var Num = 0;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Sponsor() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      print("======================${widget.UserData["Referral By"]}");
      final DocumentSnapshot snapshot = await firestore
          .collection("ReferralUID")
          .doc("${widget.UserData["Referral By"]}")
          .get();
      final ReferralUID = snapshot.data();
      print("======================$ReferralUID");

      final DocumentSnapshot snapshhot =
          await firestore.collection("users").doc(ReferralUID["UID"]).get();
      final ReferBY = snapshhot.data();
      setState(() {
        Refer_BY = ReferBY;
      });
      print("=======asd===============$Refer_BY");
    }

    if (Num == 0) {
      Sponsor();
      setState(() {
        Num = 1;
      });
      print("==========2============>$Num");
    }
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: vwidth,
              height: vhight,
              color: Color(0xff7530fb),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Sponsor Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: vwidth - 70,
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _Data(titel: "Name", Name: "${Refer_BY["username"]}"),
                              _Line,
                              _Data(
                                  titel: "Phone No",
                                  Name: "${Refer_BY["PhoneNo"]}"),
                              _Line,
                              _Data(
                                  titel: "Referral No",
                                  Name: "${Refer_BY["Referral"]}"),
                              _Line,
                              _Data(titel: "Email", Name: "${Refer_BY["email"]}"),
                            ],
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    _Space,
                    _Space,
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: vwidth - 70,
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _Data(
                                  titel: "Name",
                                  Name: "${widget.UserData["username"]}"),
                              _Line,
                              _Data(
                                  titel: "Phone No",
                                  Name: "${widget.UserData["PhoneNo"]}"),
                              _Line,
                              _Data(
                                  titel: "Referral No",
                                  Name: "${widget.UserData["Referral"]}"),
                              _Line,
                              _Data(
                                  titel: "Email",
                                  Name: "${widget.UserData["email"]}"),
                            ],
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Data extends StatefulWidget {
  final String titel;
  final String Name;
  const _Data({Key? key, required this.titel, required this.Name})
      : super(key: key);

  @override
  __DataState createState() => __DataState();
}

class __DataState extends State<_Data> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80,
            child: Text(
              widget.titel,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 130,
          child: Text(
            widget.Name,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    softWrap: false,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

Widget get _Line => Center(
      child: Container(
        width: 250,
        height: 1,
        color: Colors.black26,
      ),
    );
Widget get _Space => const SizedBox(
      height: 10,
    );
