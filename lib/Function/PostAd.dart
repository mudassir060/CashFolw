import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:ppc/Function/PopUp.dart';
import 'package:intl/intl.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
UploadAp(
    URLController, pointsController, totelPointController, userData) async {
  print(URLController.text);
  print(pointsController.text);
  print(totelPointController.text);
  print(userData['Total Point']);
  // var value1 = userData["Total Point"];
  // var value2 = int.parse(Price);
  // if (value2 <= value1) {
  //   DateTime now = DateTime.now();
  //   String formattedDate = DateFormat('EEE d MMM kk:mm:ss').format(now);
  //   await firestore.collection("Plans").doc(formattedDate).set({
  //     "Available_Balance": Balance,
  //     "Panding Balance": 0,
  //     "Daily Ads": Daily_Ads,
  //     "Total Point": Total_Point,
  //     "Total Click": 0,
  //     "Validity": No,
  //     "Remain Today Click": 0,
  //   });
  //   PopUp(context, "", "Done");
  // } else {
  //   PopUp(context, "Error", "Account Balance is Low");
  // }
}
