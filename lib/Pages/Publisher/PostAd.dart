// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Bloc/AppBar.dart';

class PostAd extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const PostAd(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);

  @override
  _PostAdState createState() => _PostAdState();
}

final TextEditingController PostAdController = TextEditingController();

class _PostAdState extends State<PostAd> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    if (kDebugMode) {
      print({
        "PostAd Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    final appBarBloc = AppBarBloc();
    appBarBloc.eventSink.add(AppBarAction.PostADS);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            width: vwidth - 50,
            height: vhight - 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Promote Your Business",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                _space,
                _space,
                _space,
                const Text(
                  "Place ad for promote.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                _space,
                _space,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Video URL",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: PostAdController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: 'https://www.abc.com',
                          hintText: "https://www.abc.com"),
                    ),
                    _space,
                    const Text(
                      "CPV-Cost Per View (Points)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: PostAdController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "2",
                      ),
                    ),
                    _space,
                    const Text(
                      "Max Spend (Points)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: PostAdController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "0"),
                    ),
                    _space,
                    ElevatedButton(
                      child: const Text(
                        'Place ad',
                        // style: TextStyle(fontSize: 10.0),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
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
