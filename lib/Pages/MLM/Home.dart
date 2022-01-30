import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ppc/Function/AdMobe.dart';
import 'package:ppc/Pages/MLM/Welcome.dart';
import 'package:ppc/Pages/Viewer/ViewAd.dart';

class Home extends StatefulWidget {
  final Map UserData;
  const Home({Key? key, required this.UserData}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Welcome(
                titel: "Welcome to Cash Flow!",
                subtitel: "Powered by Skywings",
                UserData: widget.UserData, Page: false,),
            Container(
              width: vwidth,
              height: 250,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/Poster.jpeg'),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewAd(
                            UserData: widget.UserData,
                          )),
                );
              },
              child: Container(
                width: vwidth - 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.ad_units,
                      size: 34,
                      color: Color(0xff7530fb),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Watch ads and Earn Money",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff7530fb)),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color(0xff7530fb),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.transparent,
                child: AdWidget(ad: myBanner),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
