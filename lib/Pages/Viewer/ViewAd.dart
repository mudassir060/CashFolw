import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewAd extends StatefulWidget {
    final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const ViewAd(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);


  @override
  _ViewAdState createState() => _ViewAdState();
}

class _ViewAdState extends State<ViewAd> {
  final _key = UniqueKey();
  void initState() {
    super.initState();
    var runingTime = 0;
    // for (var i = 0; i < 30; i++) {
    //   Future.delayed(const Duration(seconds: 1), () {
    //     print('===========>>>> $runingTime');
    //     setState(() {
    //       runingTime++;
    //     });
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                initialUrl: "https://www.youtube.com/watch?v=TKFDm4m3O6c",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 5.0,
                    percent: 1.0,
                    center: const Text("30 Sec"),
                    progressColor: Colors.green,
                    animation: true,
                    animationDuration: 12000,
                    footer:  const Text(
                      "Sales this week",
                      style:
                           TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
