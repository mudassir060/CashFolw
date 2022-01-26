import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ppc/Function/AdMobe.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Container(
                width: vwidth,
                color: const Color(0xff7530fb),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            size: 40,
                            color: Colors.white54,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width: vwidth,
                          child: Column(
                            children: const [
                              Text(
                                "Welcome to Cash Flow!",
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Powered by Skywings",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 140,
                          color: Colors.white54,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Skywings",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
              SizedBox(
                width: vwidth,
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
      ),
    );
  }
}
