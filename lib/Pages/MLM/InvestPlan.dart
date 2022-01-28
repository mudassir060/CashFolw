import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Pages/MLM/Welcome.dart';
import 'package:ppc/Pages/Publisher/Plan.dart';
import 'package:ppc/Pages/Viewer/InviteFriend.dart';
import 'package:ppc/Pages/Viewer/ViewAd.dart';

class InvestPlan extends StatefulWidget {
  final Map UserData;
  const InvestPlan({Key? key, required this.UserData}) : super(key: key);

  @override
  _InvestPlanState createState() => _InvestPlanState();
}

class _InvestPlanState extends State<InvestPlan> {
  @override
  Widget build(BuildContext context) {
    Map UserData = {};
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
      children: [
        Welcome(),
        Row(
          children: [
              CustomButton(
                txt: "Plan LML",
                btnFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Plan(
                              UserData: widget.UserData,
                            )),
                  );
                },
                icon: Icons.monetization_on,
              ),
              CustomButton(
                txt: "Ads",
                btnFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAd(
                              UserData: widget.UserData,
                            )),
                  );
                },
                icon: Icons.speaker,
              ),
              CustomButton(
                txt: "Invite Friends",
                btnFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InviteFriend(UserData: widget.UserData),
                    ),
                  );
                },
                icon: Icons.group_add,
              ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
                border: Border.all(color: Colors.brown, width: 4.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          border: Border.all(
                            color: Colors.brown,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Text("User Name"),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          border: Border.all(
                            color: Colors.brown,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Text("User Name"),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          border: Border.all(
                            color: Colors.brown,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Text("User Name"),
                    ),
                  ],
                ),
                Table(
                    border: TableBorder.symmetric(
                        inside: BorderSide(width: 2, color: Colors.grey),
                        outside: BorderSide(width: 3, color: Colors.brown)),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text(
                            '',
                            //style: TextStyle(fontSize: 20.0)
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                        Column(children: [
                          Text(
                            '',
                          )
                        ]),
                      ]),
                    ]),
              ],
          ),
        ),
      ],
    ),
            )));
  }
}

class CustomButton extends StatelessWidget {
  final txt;
  final icon;
  final btnFunction;

  const CustomButton({this.txt, this.icon, this.btnFunction});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 120,
          width: 120,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              border: Border.all(
                color: Colors.deepPurple,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: btnFunction,
                  iconSize: 80.0,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  )),
              Text(
                txt,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          )),
    );
  }
}
