import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Color.dart';

class P_DepositList extends StatefulWidget {
  const P_DepositList({
    Key? key,
  }) : super(key: key);

  @override
  _P_DepositListState createState() => _P_DepositListState();
}

class _P_DepositListState extends State<P_DepositList> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
        .collection('Panding Deposit')
        // .orderBy('_Price', descending: false)
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
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                              "Panding Deposit",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7530fb),
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
                                width: 110,
                                child: const Center(
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
                                width: 130,
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Payment ID",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Amount",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;
                                    Index++;
                                    return RefRow(
                                      Data: data,
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
      ),
    );
  }
}

class RefRow extends StatefulWidget {
  final Map Data;
  const RefRow({
    Key? key,
    required this.Data,
  }) : super(key: key);

  @override
  _RefRowState createState() => _RefRowState();
}

class _RefRowState extends State<RefRow> {
  bool Show_More = false;
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black12,
      width: vwidth - 15,
      child: InkWell(
        onTap: () {
          if (Show_More == false) {
            setState(() {
              Show_More = true;
            });
          } else {
            setState(() {
              Show_More = false;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        "${widget.Data['username']}",
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: Center(
                        child: Text(
                          "${widget.Data['Payment ID']}",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Center(
                        child: Text(
                          "${widget.Data['Amount']}",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Show_More
                  ? Column(
                      children: [
                        ShowFull(titel: "Email", DATA: widget.Data['email']),
                        ShowFull(
                            titel: "Phone NO", DATA: widget.Data['PhoneNo']),
                        ShowFull(titel: "Date", DATA: widget.Data['Date']),
                        ShowFull(
                            titel: "Available_Balance",
                            DATA: "${widget.Data['Available_Balance']}"),
                        ShowFull(
                            titel: "Payment ID",
                            DATA: widget.Data['Payment ID']),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: () {
                                CancelPayment(
                                    context, widget.Data['Del'], "Delete");
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       Show_More = true;
                            //     });
                            //   },
                            //   child: Column(
                            //     children: const [
                            //       Text(
                            //         "Show More",
                            //         style: TextStyle(color: Color(0xff7530fb)),
                            //       ),
                            //       Icon(
                            //         Icons.arrow_drop_down,
                            //         color: Color(0xff7530fb),
                            //       )
                            //     ],
                            //   ),
                            // ),

                            ElevatedButton(
                              child: const Text(
                                'Approved',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: () {
                                Aprove(context, widget.Data);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center()
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> CancelPayment(context, _doc, SMS) {
  CollectionReference Panding_Deposit =
      FirebaseFirestore.instance.collection('Panding Deposit');
  return Panding_Deposit.doc(_doc).delete().then((values) {
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("$SMS Successfully")),
      // content: Text("Delete Successfully"),
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
  }).catchError((error) {
    // Widget okButton = TextButton(
    //   child: Text("OK"),
    //   onPressed: () {
    //     // Navigator.of(context).pop(); // dismiss dialog
    //   },
    // );
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Error")),
      content: Text("$error"),
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

Aprove(context, Data) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var Balance = Data["Available_Balance"] + Data['Amount'];
    await firestore.collection("users").doc(Data["UID"]).update({
      "Available_Balance": Balance,
    });
    print("======================${Data["Referral By"]}");
    // // // // // // // // // // Get Referral UID  // // // // // // // // // //
    final DocumentSnapshot snapshot = await firestore
        .collection("ReferralUID")
        .doc("${Data["Referral By"]}")
        .get();
    final ReferralUID = snapshot.data();
    print("======================$ReferralUID");
    // // // // // // // // // // Get Referral Data  // // // // // // // // // //
    final DocumentSnapshot snapshhot =
        await firestore.collection("users").doc(ReferralUID["UID"]).get();
    final ReferBY = snapshhot.data();
    // // // // // // // // // // Update Referral Data  // // // // // // // // // //
    var par = (2 / Data["Amount"] * 100);
    print("======%=====>$par");
    await firestore.collection("users").doc(ReferBY["UID"]).update({
      "Available_Balance": ReferBY["Available_Balance"]+par,
    });

    await firestore.collection("Deposit").doc().set({
      "username": Data["username"],
      "email": Data["email"],
      "UID": Data["UID"],
      "PhoneNo": Data["PhoneNo"],
      "Available_Balance": Data["Available_Balance"],
      "Date": Data['Date'],
      "Del": Data["Del"],
      "Payment ID": Data['Payment ID'],
      "Amount": Data["Amount"],
    });

    CancelPayment(context, Data['Del'], "Approve");
  } catch (e) {
    // Widget okButton = TextButton(
    //   child: Text("OK"),
    //   onPressed: () {
    //     Navigator.of(context).pop(); // dismiss dialog
    //   },
    // );
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Error")),
      content: Text("${e.toString()}"),
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
}

class ROW extends StatefulWidget {
  const ROW({Key? key}) : super(key: key);

  @override
  _ROWState createState() => _ROWState();
}

class _ROWState extends State<ROW> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShowFull extends StatelessWidget {
  final String titel;
  final String DATA;

  const ShowFull({Key? key, required this.titel, required this.DATA})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(" $titel :    ${DATA}")],
      ),
    );
  }
}
