import 'package:flutter/material.dart';
import 'package:ppc/Pages/Publisher/Deposit.dart';
import 'package:ppc/Pages/Viewer/Withdraw.dart';

class Welcome extends StatefulWidget {
  final String titel;
  final String subtitel;
  final bool Page;
  final Map UserData;
  const Welcome(
      {Key? key,
      required this.titel,
      required this.subtitel,
      required this.UserData,
      required this.Page})
      : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Container(
      width: vwidth,
      color: const Color(0xff7530fb),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.Page
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Withdraw(UserData: widget.UserData)),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Icon/withdrawal.png"),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Deposit(UserData: widget.UserData)),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Icon/deposit.png"),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                width: vwidth,
                child: Column(
                  children: [
                    Text(
                      widget.titel,
                      style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      widget.subtitel,
                      style: const TextStyle(
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
            children: [
              const Icon(
                Icons.person,
                size: 140,
                color: Colors.white54,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Name: ${widget.UserData["username"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Referral No: ${widget.UserData["Referral"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Join Date: ${widget.UserData["JoinDate"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Container(
                      width: 200,
                      child: Text(
                        "Email: ${widget.UserData["email"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
