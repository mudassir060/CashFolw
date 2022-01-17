import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppc/Function/PopUp.dart';

CollectionReference Plans = FirebaseFirestore.instance.collection('Plans');
Future<void> deletePlan(context, _doc) {
  return Plans.doc(_doc)
      .delete()
      .then((values) => PopUp(context, '', "Delete Successfully"))
      .catchError((error) => PopUp(context, "", "Failed to delete: $error"));
}
