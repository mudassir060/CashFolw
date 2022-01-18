// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Cards.dart';

class Referral extends StatefulWidget {
  final Map UserData;
  const Referral({Key? key, required this.UserData})
      : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Referral Page",
        "${widget.UserData}"
      });
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
                const RefCard(LevelNo: "Level 1 Direct Referral"),
                SizedBox(height: 9,),
                const RefCard(LevelNo: "Level 2 IN Direct Referral"),
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
  const RefCard({Key? key, required this.LevelNo}) : super(key: key);

  @override
  _RefCardState createState() => _RefCardState();
}

class _RefCardState extends State<RefCard> {
  @override
  Widget build(BuildContext context) {
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
                        child: Center(
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
                        width: 50,
                        child: Center(
                          child: Text(
                            "ID",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
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
                RefRow(
                  No: 1,
                  ID: "12345",
                  Name: "Mudassir Mukhtar",
                  Number: "03454335400",
                  vwidth: vwidth,
                ),
                RefRow(
                  No: 2,
                  ID: "12345",
                  Name: "Ali Ahmad",
                  Number: "03154335443",
                  vwidth: vwidth,
                ),
                RefRow(
                  No: 3,
                  ID: "12345",
                  Name: "Azeem",
                  Number: "0333354645",
                  vwidth: vwidth,
                ),
                RefRow(
                  No: 4,
                  ID: "12345",
                  Name: "Azeem",
                  Number: "0333354645",
                  vwidth: vwidth,
                ),
           
                SizedBox(height: 5)
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
