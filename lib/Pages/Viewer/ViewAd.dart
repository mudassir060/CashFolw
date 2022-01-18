import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewAd extends StatefulWidget {
  final Map UserData;

  const ViewAd(
      {Key? key,
      required this.UserData,})
      : super(key: key);


  @override
  _ViewAdState createState() => _ViewAdState();
}

class _ViewAdState extends State<ViewAd> {
    bool Delay = false;
  final _key = UniqueKey();
  void initState() {
    super.initState();
      Future.delayed(const Duration(seconds: 5), () {
        print('===========>>>> $Delay');
        setState(() {
          Delay = true;
        });
      });
    
  }

  @override
  Widget build(BuildContext context) {
        if (kDebugMode) {
      print({
        "ViewAd Page",
        "${widget.UserData}"
      });
    }
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
            Delay ?
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
            ): Center()
         
            ],
        ),
    );
  }
}
