import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Function/PopUp.dart';

CollectionReference Plans = FirebaseFirestore.instance.collection('Plans');
Future<void> deletePlan(context, _doc) {
  return Plans.doc(_doc).delete().then((values) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Error")),
      content: Text("Delete Successfully"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }).catchError((error) {  Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Error")),
        content: Text("Failed to delete: $error"),
        actions: [
          okButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
   } );
}
