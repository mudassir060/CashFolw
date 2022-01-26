// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Color.dart';

class UserList extends StatefulWidget {


  const UserList({Key? key,})
      : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
        .collection('users')
        // .orderBy('Referral', descending: false)
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "User List",
                            style: const TextStyle(
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
                                    Name: '${data['username']}',
                                    Number: '${data['PhoneNo']}',
                                    UID: '${data['UID']}',
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
          ),
        ),
      ),
    );
  }
}

class RefRow extends StatelessWidget {
  var No;
  final String Name;
  final String Number;
  final String UID;
  var vwidth;
  RefRow(
      {Key? key,
      required this.No,
      required this.Name,
      required this.Number,
      required this.vwidth, required this.UID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colr = No % 2;

    return Container(
      color: colr == 1 ? Colors.black12 : Colors.black26,
      width: vwidth - 15,
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
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
            IconButton(
                        onPressed: () {
                          deleteUser(context,UID );
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 24,
                          color: Color(0xff7530fb),
                        ))
          ],
        ),
      ),
    );
  }
}




CollectionReference users = FirebaseFirestore.instance.collection('users');
Future<void> deleteUser(context, _doc) {
  return users.doc(_doc).delete().then((values) {
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
  }).catchError((error) {  Widget okButton = TextButton(
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
   } );
}
