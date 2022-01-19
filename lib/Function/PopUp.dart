import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

PopUp(context, titel, message) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  AlertDialog alert = AlertDialog(
    title: Center(child: Text(titel)),
    content: Center(child: Text("$message")),
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
}
