import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ppc/Function/AdMobe.dart';
import 'package:ppc/Pages/MLM/Welcome.dart';
import 'package:share_plus/share_plus.dart';

class MyInvest extends StatefulWidget {
  final Map UserData;
  const MyInvest({Key? key, required this.UserData}) : super(key: key);

  @override
  _MyInvestState createState() => _MyInvestState();
}

class _MyInvestState extends State<MyInvest> {
    void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myBanner.load();
    super.initState();
  }
  var Num = 0;
  var UserData = {};
  @override
  Widget build(BuildContext context) {
    getdata() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final DocumentSnapshot snapshot =
          await firestore.collection("users").doc(widget.UserData['UID']).get();
      final data = snapshot.data();
      setState(() {
        UserData = data;
      });
    }

    @override
    void initState() {
      getdata();
            print("++++++++++++++++++++++initState");
      super.initState();
    }

    if (Num == 0) {
      getdata();
      print("++++++++++++++++++++++with Function");
      setState(() {
        Num = 1;
      });
    }
    InviteNow() {
      Share.share("""*CASHFLOW MLM & ADS* 
Are you still looking for a side hustle without risking your job?
I have found something that might work with you.
If you are interested to join me please use my invitation referral code# ${widget.UserData["Referral"]} to join my team and get great bonus and opportunities to create your own team with cash flow.""");
      // share;
//                       Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
// Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
    }

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Welcome(
              titel: "Welcome to Cash Flow!",
              subtitel: "Powered by Skywings",
              UserData: widget.UserData,
              Page: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: vwidth,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Plan Name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7530fb)),
                      ),
                      Text(
                        "${UserData["PlanName"]}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7530fb),
                        ),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: vwidth,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Earning",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7530fb)),
                      ),
                      Row(
                        children: [
                          Text(
                            "${UserData["Available_Balance"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " \$ ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7530fb)),
                          ),
                          Text('/person')
                        ],
                      )
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
            ),
            Row_Data(
                titel: "Refel Bounes", value: "${UserData["Refel Bounes"]}"),
            Row_Data(titel: "Team Bounes", value: "${UserData["team Bounes"]}"),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.transparent,
                child: AdWidget(ad: myBanner),
              ),
            ),
            Row_Data(titel: "Ads Bounes", value: "${UserData["Ads Bounes"]}"),
            Row_Data(titel: "Totel Point", value: "${UserData["Total Point"]}"),
            Row_Data(
                titel: "Totel Clicks", value: "${UserData["Total Click"]}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: vwidth,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.people,
                        color: Color(0xff7530fb),
                        size: 40,
                      ),
                      Text(
                        "${widget.UserData["Referral"]}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black26,
                        ),
                      ),
                      IconButton(
                        onPressed: InviteNow,
                        icon: const Icon(
                          Icons.forward_outlined,
                          color: Color(0xff7530fb),
                          size: 30,
                        ),
                      )
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
            )
          ],
        ),
      ),
    );
  }
}

class Row_Data extends StatefulWidget {
  final String titel;
  final String value;
  const Row_Data({Key? key, required this.titel, required this.value})
      : super(key: key);

  @override
  _Row_DataState createState() => _Row_DataState();
}

class _Row_DataState extends State<Row_Data> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: vwidth,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.titel,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7530fb)),
              ),
              Row(
                children: [
                  Text(
                    widget.value,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
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
