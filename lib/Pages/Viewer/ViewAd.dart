import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ViewAd extends StatefulWidget {
  @override
  createState() => _ViewAdState();
}
class _ViewAdState extends State<ViewAd> {
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: "www.google.com"))
          ],
        ));
  }
}