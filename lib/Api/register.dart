// ignore_for_file: unnecessary_const, unnecessary_null_comparison, avoid_print

import 'dart:io';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppc/Api/login.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Function/PopUp.dart';
import 'package:ppc/Pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppc/Widget/Color.dart';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController countrycontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  // final TextEditingController otpcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();
  final TextEditingController ReferralBycontroller = TextEditingController();
  String UID = '';
  bool isCheck = false;
  bool NoData = false;
  bool looding = false;
  void register() async {
    setState(() {
      looding = true;
    });
    final String username = usernamecontroller.text;
    final String firstname = firstnamecontroller.text;
    final String lastname = lastnamecontroller.text;
    final String country = countrycontroller.text;
    final String useremail = emailcontroller.text.trim();
    final String PhoneNo = phonenocontroller.text;
    final String userpassword = userpasswordcontroller.text;
    String ReferralBy = ReferralBycontroller.text;

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      if (username != '' &&
          useremail != '' &&
          PhoneNo != '' &&
          userpassword != '') {
        var LastReferral = 0;
        await firestore
            .collection("users")
            .get()
            .then((snapshot) => snapshot.docs.forEach((element) {
                  var fdata = element.data();
                  if (fdata["Referral"] >= LastReferral) {
                    setState(() {
                      LastReferral = fdata["Referral"];
                      LastReferral++;
                    });
                  }
                }));
        print(
            "++++++++++++++++++Firebase largeindex $LastReferral+++++++++++++++++++++");
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('EEE d MMM').format(now);
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: emailcontroller.text, password: userpasswordcontroller.text);
        setState(() {
          UID = user.user.uid;
        });
        print("============UID=============>$UID");
        await firestore.collection("users").doc(UID).set({
          "username": username,
          "email": useremail,
          "First Name": firstname,
          "Last Name": lastname,
          // "countery": country,
          "PhoneNo": PhoneNo,
          "password": userpassword,
          "JoinDate": formattedDate,
          "UID": user.user.uid,
          "Available_Balance": 0,
          "Panding Balance": 0,
          "Daily Ads": 0,
          "Total Point": 0,
          "Total Click": 0,
          "Remain Today Click": 0,
          "Referral": LastReferral,
          "Referral By": ReferralBy,
          "Last Login": "",
          "Last Add View": 0,
          "Refel Bounes": 0,
          "Ads Bounes": 0,
          "team Bounes": 0,
          "PlanName": ""
        });
        print("obj=======ect");
        await firestore.collection("ReferralUID").doc("$LastReferral").set({
          "UID": UID,
        });
        print("""-------------------------""");
        if (ReferralBycontroller.text == "") {
          setState(() {
            ReferralBy = "0";
          });
        } 
        print("+++++++++");
        await firestore.collection(ReferralBy).doc(UID).set({
          "username": username,
          "email": useremail,
          "PhoneNo": PhoneNo,
          "Referral": LastReferral,
          "Amount": 0,
        });
        print("-=-=-=-=-=-object");

        final DocumentSnapshot snapshot =
            await firestore.collection("ReferralUID").doc(ReferralBy).get();
        final ReferralUID = snapshot.data();

        final DocumentSnapshot snapshhot =
            await firestore.collection("users").doc(ReferralUID["UID"]).get();
        final ReferBY = snapshhot.data();
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
      // Widget okButton = TextButton(
      //   child: Text("OK"),
      //   onPressed: () {
      //     Navigator.of(context).pop(); // dismiss dialog
      //   },
      // );
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Error")),
        content: Text("${e.toString()}"),
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
  }

  @override
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign in',
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: vwidth,
            child: CustomPaint(
              painter: CurvePainter2(),
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 12, right: 12),
                child: Stack(
                  children: [
                    looding
                        ? const Positioned(
                            child: Center(child: CircularProgressIndicator()))
                        : Center(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 40),
                            Text(
                              "New Account!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            Text(
                              "Sign Up and get started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: 65),
                              // Container(
                              //   height: 130,
                              //   width: 280,
                              //   decoration: BoxDecoration(
                              //     image: const DecorationImage(
                              //       image: AssetImage('images/Logo.png'),
                              //       fit: BoxFit.fitWidth,
                              //     ),
                              //     borderRadius: BorderRadius.circular(10),
                              //     shape: BoxShape.rectangle,
                              //   ),
                              // ),
                              // const SizedBox(height: 20),
                              // // // // // // // // // // Email input // // // // // // // // //
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  TextField(
                                    controller: emailcontroller,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: "Email"),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "User Name",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  TextField(
                                    controller: usernamecontroller,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: "username"),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 160,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "First Name",
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                            TextField(
                                              controller: firstnamecontroller,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  // labelText: 'Email',
                                                  hintText: "First Name"),
                                            ),
                                            const SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 160,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "Last Name",
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                            TextField(
                                              controller: lastnamecontroller,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  // labelText: 'Email',
                                                  hintText: "First Name"),
                                            ),
                                            const SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  TextField(
                                    controller: phonenocontroller,                keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: "03XX-XXXXXXX"),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Referral No",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  TextField(
                                    controller: ReferralBycontroller,                keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: "Referral No"),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Password",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  TextField(
                                    controller: userpasswordcontroller,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      // labelText: 'Password',
                                      hintText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          // color: Theme.of(context).primaryColorDark,
                                        ),
                                        onPressed: () {
                                          _toggle();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              ElevatedButton(
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 100, right: 100),
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
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
                              const SizedBox(height: 20),
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xff7530fb),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 100, right: 100),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
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
        ),
      ),
    );
  }
}

class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xff7530fb);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 4, size.height / 6, size.width, size.height * 0.15);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
