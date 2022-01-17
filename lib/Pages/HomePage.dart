// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Bloc/AppBar.dart';
import 'package:ppc/Pages/Publisher/Deposit.dart';
import 'package:ppc/Pages/Publisher/Plan.dart';
import 'package:ppc/Pages/Publisher/PostAd.dart';
import 'package:ppc/Pages/Viewer/Referral.dart';
import 'package:ppc/Pages/Viewer/ViewAd.dart';
import 'package:ppc/Pages/Viewer/Withdraw.dart';

class HomePage extends StatefulWidget {
  final Map UserData;

  const HomePage({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print({
        "Home Page",
        "${widget.UserData}"
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      // ),
      home: Scaffold(
        body: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200.0,
          children: const [
            Grid_Card(icon_Data: Icons.add_box, titel: "Place ad"),
            Grid_Card(icon_Data: Icons.payment, titel: "Deposit"),
            Grid_Card(icon_Data: Icons.money, titel: "Withdraw"),
            Grid_Card(icon_Data: Icons.help, titel: "Plan"),
            Grid_Card(icon_Data: Icons.refresh, titel: "Referral"),
            // Grid_Card(icon_Data: Icons.dashboard, titel: "Transaction"),
            Grid_Card(icon_Data: Icons.ad_units, titel: "ADS View"),
          ],
        ),
      ),
    );
  }
}

class Grid_Card extends StatelessWidget {
  final IconData icon_Data;
  final String titel;
  const Grid_Card({
    Key? key,
    required this.icon_Data,
    required this.titel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarBloc = AppBarBloc();
    return GestureDetector(
      onTap: () {
        if (titel == "Place ad") {
          appBarBloc.eventSink.add(AppBarAction.PostADS);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostAd(
                Name: "Name",
                Email: "Email",
                PhoneNo: "PhoneNo",
                UID: "UID",
              ),
            ),
          );
        }
        if (titel == "Deposit") {
          appBarBloc.eventSink.add(AppBarAction.Deposit);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Deposit(
                Name: "Name",
                Email: "Email",
                PhoneNo: "PhoneNo",
                UID: "UID",
              ),
            ),
          );
        }
        if (titel == "Withdraw") {
          appBarBloc.eventSink.add(AppBarAction.Withdraw);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Withdraw(
                Name: "Name",
                Email: "Email",
                PhoneNo: "PhoneNo",
                UID: "UID",
              ),
            ),
          );
        }
        if (titel == "Plan") {
          appBarBloc.eventSink.add(AppBarAction.Plan);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Plan(
                Name: "Name",
                Email: "Email",
                PhoneNo: "PhoneNo",
                UID: "UID",
                Admin: false,
              ),
            ),
          );
        }
        if (titel == "Referral") {
          appBarBloc.eventSink.add(AppBarAction.Referral);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Referral(
                Name: "Name",
                Email: "Email",
                PhoneNo: "PhoneNo",
                UID: "UID",
              ),
            ),
          );
        }
        if (titel == "ADS View") {
          appBarBloc.eventSink.add(AppBarAction.ADSView);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ViewAd(
                Name: "Name",
                Email: "Email",
                PhoneNo: "PhoneNo",
                UID: "UID",
              ),
            ),
          );
        }
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
              Icon(
                icon_Data,
                size: 100,
                color: Colors.blueAccent.shade200,
              ),
              Text(
                titel,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
