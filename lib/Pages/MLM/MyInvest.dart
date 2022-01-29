import 'package:flutter/material.dart';
import 'package:ppc/Pages/MLM/Welcome.dart';
import 'package:share_plus/share_plus.dart';

class MyInvest extends StatefulWidget {
  final Map UserData;
  const MyInvest({Key? key, required this.UserData}) : super(key: key);

  @override
  _MyInvestState createState() => _MyInvestState();
}

class _MyInvestState extends State<MyInvest> {
  @override
  Widget build(BuildContext context) {
    InviteNow() {
      Share.share(
        """*CASHFLOW MLM & ADS* 
Are you still looking for a side hustle without risking your job?
I have found something that might work with you.
If you are interested to join me please use my invitation referral code# ${widget.UserData["Referral"]} to join my team and get great bonus and opportunities to create your own team with cash flow."""
);
      // share;
//                       Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
// Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
    }

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Welcome(
              titel: "Welcome to Cash Flow!",
              subtitel: "Powered by Skywings",
              UserData: widget.UserData, Page: false,),
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
                      "${widget.UserData["Plan Name"]}",
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
                          "${widget.UserData["Available_Balance"]}",
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
          const SizedBox(
            height: 90,
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
    );
  }
}
