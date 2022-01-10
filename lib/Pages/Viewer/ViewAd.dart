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
  // var runing_time = 0;
  // run() {
  //   for (var i = 0; i < 30; i++) {
  //    sleep(const Duration(seconds:1));
  //     setState(() {
  //       runing_time++;
  //     });
  //     print("============>>>>>$runing_time");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // run();
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
