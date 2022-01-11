import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewAd extends StatefulWidget {
  const ViewAd({Key? key}) : super(key: key);

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
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                initialUrl: "https://www.youtube.com/watch?v=TKFDm4m3O6c",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            const Center(
                child: CircularProgressIndicator(
              strokeWidth: 6,
            )),
          ],
        ),
      ),
    );
  }
}
