import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppc/Function/PopUp.dart';

class Create_Plan extends StatefulWidget {
  @override
  _Create_PlanState createState() => _Create_PlanState();
}

class _Create_PlanState extends State<Create_Plan> {
  final TextEditingController titelcontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController daily_limitcontroller = TextEditingController();
  final TextEditingController Validitecontroller = TextEditingController();
  final TextEditingController pointscontroller = TextEditingController();

  int largeindex = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;

    void CreatePlan() async {
      String _Titel = titelcontroller.text;
      String _Price = pricecontroller.text;
      String _Daily_Limit = daily_limitcontroller.text;
      String _Validite = Validitecontroller.text;
      String _Points = pointscontroller.text;

      if (_Titel != "" &&
          _Price != "" &&
          _Daily_Limit != "" &&
          _Validite != "" &&
          _Points != "") {
        try {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('EEE d MMM kk:mm:ss').format(now);
          await firestore.collection("Plans").doc(formattedDate).set({
            "Date": formattedDate,
            "_Titel": _Titel,
            "_Price": _Price,
            "_Daily_Limit": _Daily_Limit,
            "_Validite": _Validite,
            "_Points": _Points,
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Create Plan Successfully'),
          //     duration: Duration(seconds: 3),
          //   ),
          // );
          setState(() {});
            Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        // title: Center(child: Text("Error")),
        content: Text("Create Plan Successfully"),
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
   
          // Navigator.of(context).pop();
        } catch (e) {
          print("Error ==============>$e");
            Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Error")),
        content: Text("${e.toString()}"),
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
   
        }
      } else {
          Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Error")),
        content: Text("Please fill all requirement"),
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
   
      }
      // print([username, useremail, userpassword]);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Create New Plan"),
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back,
        //       )),
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: vwidth - 50,
              height: vhight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create New Plan",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7530fb)),
                  ),
                  _space,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Titel:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: titelcontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Basic Plan"),
                      ),
                      _space,
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Price:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: pricecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "0-1000",
                        ),
                      ),
                      _space,
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Daily Limit:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: daily_limitcontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "1-5000"),
                      ),
                      _space,
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Validite:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: Validitecontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "0-30"),
                      ),
                      _space,
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Points:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: pointscontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "0-5000"),
                      ),
                      _space,
                      Center(
                        child: ElevatedButton(
                          child: const Text(
                            'Create Plan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: CreatePlan,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
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
    );
  }
}

Widget get _space => const SizedBox(
      height: 20,
    );
