// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WithdrawList extends StatefulWidget {
  const WithdrawList({Key? key}) : super(key: key);

  @override
  _WithdrawListState createState() => _WithdrawListState();
}

class _WithdrawListState extends State<WithdrawList> {
  final Stream<QuerySnapshot> _WithdrawStream = FirebaseFirestore.instance
      .collection('Plans')
      .orderBy('_Price', descending: false)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
        const Text(
          "Withdraw",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff7530fb)),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: _WithdrawStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            return Container(
              margin: EdgeInsets.all(10),
              child: Table(
                // defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: const [
                      Text('Website',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    Column(children: const [
                      Text('Tutorial',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    Column(children: const [
                      Text('Review',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    Column(children: const [
                      Text('Review',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('Flutter')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                  ]),
                ],
              ),
            );
          },
        ),
      ])),
    );
  }
}
