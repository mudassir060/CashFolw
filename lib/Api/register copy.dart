// ignore_for_file: unnecessary_const, unnecessary_null_comparison, avoid_print

import 'dart:io';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ppc/Api/login.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Function/PopUp.dart';
import 'package:ppc/Pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppc/Widget/Color.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController usernamecontroller =
      TextEditingController(text: "Mudassir");
  final TextEditingController useremailcontroller =
      TextEditingController(text: "asd@gmail.com");
  final TextEditingController phonenocontroller =
      TextEditingController(text: "03454335400");
  // final TextEditingController otpcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller =
      TextEditingController(text: "qwerty");
  final TextEditingController ReferralBycontroller =
      TextEditingController(text: "102");
  String UID = '';
  bool isCheck = false;
  bool NoData = false;
  bool looding = false;

  @override
  Widget build(BuildContext context) {
    final databaseRef =
        FirebaseDatabase.instance.reference(); //database reference object
    void register() async {
      setState(() {
        looding = true;
      });
      final String username = usernamecontroller.text;
      final String useremail = useremailcontroller.text;
      final String PhoneNo = phonenocontroller.text;
      final String userpassword = userpasswordcontroller.text;
      final String ReferralBy = ReferralBycontroller.text;

      FirebaseAuth auth = FirebaseAuth.instance;
      // FirebaseFirestore firestore = FirebaseFirestore.instance;
      try {
        if (username != null ||
            useremail != null ||
            PhoneNo != null ||
            userpassword != null) {
          var LastReferral = 0;

          await databaseRef
              // .child("users")
              // .child(UID)
              .once()
              .then((DataSnapshot snapshot) {
            print(
                'Data====     =====> : ${snapshot.value}');
            // var fdata = snapshot.value;
            // print("=-=-=-=-=-=-=-=-=-=->${fdata["Referral"]}");
            // if (fdata["Referral"] >= LastReferral) {
            //   setState(() {
            //     LastReferral = fdata["Referral"];
            //     LastReferral++;
            //   });
            // }
          });
          // await firestore
          //     .collection("users")
          //     .get()
          //     .then((snapshot) => snapshot.docs.forEach((element) {
          //           var fdata = element.data();
          //           if (fdata["Referral"] >= LastReferral) {
          //             setState(() {
          //               LastReferral = fdata["Referral"];
          //               LastReferral++;
          //             });
          //           }
          //         }));
          print(
              "++++++++++++++++++Firebase largeindex $LastReferral+++++++++++++++++++++");

          final UserCredential user = await auth.createUserWithEmailAndPassword(
              email: useremailcontroller.text,
              password: userpasswordcontroller.text);
          setState(() {
            UID = user.user.uid;
          });

          await databaseRef.child('user').child(UID).set({
            "username": username,
            "email": useremail,
            "PhoneNo": PhoneNo,
            "password": userpassword,
            "UID": user.user.uid,
            "Available_Balance": 0,
            "Panding Balance": 0,
            "Daily Ads": 0,
            "Total Point": 0,
            "Total Click": 0,
            "Remain Today Click": 0,
            "Referral": LastReferral,
          });

          // await firestore.collection("users").doc(UID).set({
          //   "username": username,
          //   "email": useremail,
          //   "PhoneNo": PhoneNo,
          //   "password": userpassword,
          //   "UID": user.user.uid,
          //   "Available_Balance": 0,
          //   "Panding Balance": 0,
          //   "Daily Ads": 0,
          //   "Total Point": 0,
          //   "Total Click": 0,
          //   "Remain Today Click": 0,
          //   "Referral": LastReferral,
          // });

          await databaseRef.child(ReferralBy).child(UID).set({
            "username": username,
            "email": useremail,
            "PhoneNo": PhoneNo,
            "password": userpassword,
            "Referral": LastReferral,
          });
          // await firestore.collection(ReferralBy).doc(UID).set({
          //   "username": username,
          //   "email": useremail,
          //   "PhoneNo": PhoneNo,
          //   "password": userpassword,
          //   "Referral": LastReferral,
          // });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        } else {
          print(
              "Name: $username Email: $useremail Password: $userpassword Phone No: $PhoneNo");
          setState(() {
            NoData = true;
          });
        }
        setState(() {
          looding = false;
        });
      } catch (e) {
        setState(() {
          looding = false;
        });
        PopUp(context, "Error", e);
      }
    }

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Welcome to Arya Solutions'),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    looding
                        ? const Positioned(
                            child: Center(child: CircularProgressIndicator()))
                        : Center(),
                    Container(
                      height: vhight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // +++++++++++++++++++++++++++++++++++++++Logo Image+++++++++++++++++++++++++++++++++++++++++++++++++++++++
                          Container(
                            height: 150,
                            width: 220,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('images/Logo.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                          ),

                          const SizedBox(height: 10),
                          TextField(
                            controller: usernamecontroller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Username",
                              labelText: "User Name",
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: useremailcontroller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Email",
                              labelText: "Email",
                            ),
                          ),

                          const SizedBox(height: 10),
                          TextField(
                            controller: phonenocontroller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Phone Number",
                                labelText: "Phone Number"),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: userpasswordcontroller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Password"),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: ReferralBycontroller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Referral No"),
                          ),
                          NoData == true
                              ? const Text(
                                  "Please fill all requirement",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10),
                                )
                              : Container(),
                          const SizedBox(height: 10),

                          ElevatedButton(
                            child: const Text(
                              'Registration',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: register,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "I have an account? Login",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
