// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Bloc/AppBar.dart';
import 'package:ppc/Function/PopUp.dart';
import 'package:ppc/Function/PostAd.dart';
import 'package:ppc/Widget/Color.dart';
import 'package:intl/intl.dart';

class PostAd extends StatefulWidget {
  final Map UserData;

  const PostAd({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _PostAdState createState() => _PostAdState();
}

final TextEditingController URLController = TextEditingController();
final TextEditingController PointsController = TextEditingController();
final TextEditingController TotelPointController = TextEditingController();
var Num = 0;
var UserData = {};

class _PostAdState extends State<PostAd> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
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
      print({"PostAd Page", "${UserData}"});
    }
    final appBarBloc = AppBarBloc();
    appBarBloc.eventSink.add(AppBarAction.PostADS);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Place Ad",
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
          child: SizedBox(
            height: vhight,
            width: vwidth,
            child: Center(
              child: Container(
                  width: 320,
                  height: 410,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Promote Your Business",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      _space,
                      Container(
                        width: 400,
                        height: 350,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(children: [
                            _space,
                            const Text(
                              "Place ad for promote.",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            _space,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "URL",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextField(
                                  controller: URLController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      hintText: "https://www.abc.com"),
                                ),
                                _space,
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "CPV-Cost Per View (Points)",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextField(
                                  controller: PointsController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    hintText: "2-10",
                                  ),
                                ),
                                _space,
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Max Spend (Points)",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: TotelPointController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      hintText: "2-5000"),
                                ),
                                _space,
                                Center(
                                  child: ElevatedButton(
                                      child: const Text(
                                        'Place ad',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      onPressed: () async {
                                        var LastAd = 0;
                                        await firestore
                                            .collection("Ads")
                                            .get()
                                            .then((snapshot) => snapshot.docs
                                                    .forEach((element) {
                                                  var fdata = element.data();
                                                  if (fdata["LastAd"] >=
                                                      LastAd) {
                                                    setState(() {
                                                      LastAd = fdata["LastAd"];
                                                      LastAd++;
                                                    });
                                                  }
                                                }));
                                        print(
                                            "++++++++++++++++++Firebase largeindex $LastAd+++++++++++++++++++++");
                                        var value1 = UserData["Total Point"];
                                        print(
                                            "---------value1----------->$value1");
                                        var value2 = int.parse(
                                            TotelPointController.text);
                                        print(
                                            "---------value2----------->$value2");
                                        DateTime now = DateTime.now();
                                        String formattedDate =
                                            DateFormat('EEE d MMM kk:mm:ss')
                                                .format(now);
                                        print(
                                            "---------DateTime----------->$formattedDate");
                                        if (value2 <= value1) {
                                          await firestore
                                              .collection("Ads")
                                              .doc("$LastAd")
                                              .set({
                                            "Url": URLController.text,
                                            "UID": widget.UserData["UID"],
                                            "Ad Type": "Youtube",
                                            "LastAd": LastAd,
                                          });
                                          var Total_Point =
                                              UserData["Total Point"] -
                                                  int.parse(TotelPointController
                                                      .text);
                                          print(
                                              "--------- UserData----------->${UserData["Total Point"]}");
                                          print(
                                              "---------Total_Point----------->$Total_Point");
                                          await firestore
                                              .collection("users")
                                              .doc("${widget.UserData["UID"]}")
                                              .update({
                                            "Total Point": Total_Point,
                                          });

                                          AlertDialog alert = AlertDialog(
                                            title: Center(child: Text("Done")),
                                          );
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            },
                                          );
                                          setState(() {});
                                        } else {
                                          // Widget okButton = TextButton(
                                          //   child: Text("OK"),
                                          //   onPressed: () {
                                          //     Navigator.of(context)
                                          //         .pop(); // dismiss dialog
                                          //   },
                                          // );
                                          AlertDialog alert = const AlertDialog(
                                            title: Center(child: Text("Error")),
                                            content: Text("Faild"),
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
                                        }
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      )))),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue,
                              Colors.purple,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
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

Widget get _space => const SizedBox(
      height: 10,
    );
