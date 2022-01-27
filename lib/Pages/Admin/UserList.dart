import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Color.dart';

class UserList extends StatefulWidget {
  const UserList({
    Key? key,
  }) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
        .collection('users')
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
                            "Users List",
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
                                    No: Index,
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
    );
  }
}

class RefRow extends StatefulWidget {
  var No;
  final Map Data;
  RefRow({
    required this.No,
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
    var colr = widget.No % 2;
    return Container(
      color: colr == 1 ? Colors.black12 : Colors.black26,
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
                      width: 30,
                      child: Center(
                        child: Text(
                          "${widget.No}",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: Text(
                        "${widget.Data['username']}",
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          "${widget.Data['PhoneNo']}",
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
                            titel: "Phone NO", DATA: "${widget.Data['PhoneNo']}"),
                        ShowFull(titel: "Panding Balance", DATA: "${widget.Data['Panding Balance']}"),
                        ShowFull(titel: "Referral", DATA: "${widget.Data['Referral']}"),
                        ShowFull(titel: "Total Point", DATA:"${ widget.Data['Total Point']}"),
                        ShowFull(titel: "Total Click", DATA: "${widget.Data['Total Click']}"),
                        ShowFull(titel: "Panding Balance", DATA: "${widget.Data['Panding Balance']}"),
                        ShowFull(
                            titel: "Available_Balance",
                            DATA: "${widget.Data['Available_Balance']}"),
                        ShowFull(
                            titel: "Password",
                            DATA: widget.Data['password']),
                        ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          onPressed: () {
                            CancelPayment(context, widget.Data['UID']);
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
                    )
                  : const Center()
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> CancelPayment(context, _doc) {
  CollectionReference Panding_Deposit =
      FirebaseFirestore.instance.collection('users');
  return Panding_Deposit.doc(_doc).delete().then((values) {
    AlertDialog alert = const AlertDialog(
      title: Center(child: Text("Delete Successfully")),
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
