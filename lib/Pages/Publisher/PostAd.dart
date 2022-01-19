// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Bloc/AppBar.dart';

class PostAd extends StatefulWidget {
  final Map UserData;

  const PostAd({
    Key? key,
    required this.UserData,
  }) : super(key: key);

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
      print({"PostAd Page", "${widget.UserData}"});
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
                        color: Colors.red),
                  ),
                  _space,
                  Container(
                    width: 400,
                    height: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            const Text(
                              "Video URL",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: PostAdController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(35.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(35.7),
                                  ),
                                  hintText: "https://www.abc.com"),
                            ),
                            _space,
                            const Text(
                              "CPV-Cost Per View (Points)",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: PostAdController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(35.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(35.7),
                                  ),                                hintText: "2-10",
                              ),
                            ),
                            _space,
                            const Text(
                              "Max Spend (Points)",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: PostAdController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(35.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(35.7),
                                  ),                                  hintText: "2-5000"),
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
                                onPressed: () {},
                              ),
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
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                  ),
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
    );
  }
}

Widget get _space => const SizedBox(
      height: 10,
    );
