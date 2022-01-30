import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Api/login.dart';
import 'package:ppc/Pages/Admin/Create_Plan.dart';
import 'package:ppc/Pages/Admin/Navigation.dart';
import 'package:ppc/Pages/Admin/P_DepositList.dart';
import 'package:ppc/Pages/Admin/P_WithdrawList.dart';
import 'package:ppc/Pages/Admin/UserList.dart';
import 'package:ppc/Pages/Admin/WithdrawList.dart';
import 'package:ppc/Pages/BottomBar.dart';
import 'package:ppc/Pages/Publisher/Plan.dart';
import 'package:ppc/Pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pay Per Click',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          // Initialize FlutterFire
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return const Text("Some thing Went Wrong");
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              Map UserData = {};
              return SplashScreen();
              // Center(
              //   child: Column(
              //     children: [
              //       SizedBox(height: 170,),
              //       ElevatedButton(
              //         child: Padding(
              //           padding: const EdgeInsets.all(56.0),
              //           child: const Text(
              //             'User',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15,
              //             ),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => SplashScreen()),
              //           );
              //         },
              //         style: ButtonStyle(
              //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(18.0),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 30,
              //       ),
              //       ElevatedButton(
              //         child: Padding(
              //           padding: const EdgeInsets.all(50.0),
              //           child: const Text(
              //             'Admin',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15,
              //             ),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => SideNavigation()),
              //           );
              //         },
              //         style: ButtonStyle(
              //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(18.0),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // );

            }

            // Otherwise, show something whilst waiting for initialization to complete
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
