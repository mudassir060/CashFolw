// ignore_for_file: non_constant_identifier_names

import 'package:ppc/Api/register.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Pages/BottomBar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppc/Pages/HomePage.dart';
import 'package:ppc/Widget/Color.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // FlutterSecureStorage storage = const FlutterSecureStorage(); // 1
  bool looding = false;
  final TextEditingController useremailcontroller = TextEditingController(text: "xyz@gmail.com");
  final TextEditingController userpasswordcontroller = TextEditingController(text: "qwerty");

  void register() async {
    // storage.write(key: "uid", value: userpasswordcontroller.text);

    setState(() {
      looding = true;
    });
    Map UserData = {};
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String useremail = useremailcontroller.text.trim();
    final String userpassword = userpasswordcontroller.text;
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: useremail, password: userpassword);
      final DocumentSnapshot snapshot =
          await firestore.collection("users").doc(user.user.uid).get();
      final data = snapshot.data();
      setState(() {
        UserData = data;
      });
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('EEE d MMM').format(now);
      if (formattedDate != data["Last Login"]) {
        await firestore.collection("users").doc(user.user.uid).update({
          "Last Login": formattedDate,
          "Daily Ads": 50,
        });
      }
      print(
          '=========================User is Login...=============================');
      print("Name =====> ${UserData["username"]}");
      print("Email =====> ${UserData["email"]}");
      print("Phone No =====> ${UserData["PhoneNo"]}");

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BottomBar(
                  UserData: UserData,
                )),
      );
      setState(() {
        looding = false;
      });
    } catch (e) {
      setState(() {
        looding = false;
      });
      print("Error ==============>$e");
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

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initstate() {
    super.initState();
    register();
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
            height: vhight,
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
                              "Welcome!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            Text(
                              "Sign in and get started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Container(
                                height: 130,
                                width: 280,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('images/Logo.png'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              const SizedBox(height: 20),
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
                                    controller: useremailcontroller,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: "Email"),
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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Forget Password',
                                        style: TextStyle(fontSize: 14.0),
                                      )),
                                ],
                              ),
                              // SizedBox(height: 10),
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
                                "Don't have an account? ",
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
                                    'Sign up',
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
                                      builder: (context) =>
                                          const Registration(),
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
