import 'package:cloud_firestore/cloud_firestore.dart';
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
    final Stream<QuerySnapshot> _PlanStream = FirebaseFirestore.instance
        .collection('${widget.UserData['Referral']}')
        .orderBy('Referral', descending: false)
        .snapshots();

    Map UserData = {};
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Welcome(
                  titel: "Details", subtitel: "", UserData: widget.UserData),
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
                          builder: (context) =>
                              InviteFriend(UserData: widget.UserData),
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
                    border: Border.all(color: Color(0xff7530fb), width: 4.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff7530fb),
                              border: Border.all(
                                color: Color(0xff7530fb),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff7530fb),
                              border: Border.all(
                                color: Colors.brown,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text("Refel No",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff7530fb),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text("Amount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: _PlanStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        var vwidth = MediaQuery.of(context).size.width;
                        var vhight = MediaQuery.of(context).size.height;
                        var Index = 0;
                        return SizedBox(
                          height: 100,
                          child: ListView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            controller: ScrollController(),
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              Index++;
                              print("===================>$data");
                              return RefRow(
                                No: Index,
                                ID: '${data['Referral']}',
                                Name: '${data['username']}',
                                Number: '${data['PhoneNo']}',
                                vwidth: vwidth,
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),

                    // Table(
                    //     border: TableBorder.symmetric(
                    //         inside: BorderSide(width: 2, color: Colors.grey),
                    //         outside: BorderSide(width: 3, color: Colors.brown)),
                    //     children: [
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //       TableRow(children: [
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //             //style: TextStyle(fontSize: 20.0)
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //         Column(children: [
                    //           Text(
                    //             '',
                    //           )
                    //         ]),
                    //       ]),
                    //     ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

class RefRow extends StatelessWidget {
  var No;
  final String ID;
  final String Name;
  final String Number;
  var vwidth;
  RefRow(
      {Key? key,
      required this.No,
      required this.ID,
      required this.Name,
      required this.Number,
      required this.vwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colr = No % 2;

    return Container(
      color: colr == 1 ? Colors.black12 : Colors.black26,
      width: vwidth - 15,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            // SizedBox(
            //   width: 30,
            //   child: Center(
            //     child: Text(
            //       "$No",
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 100,
                child: Text(
                  Name,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  ID,
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: Text(
                  Number,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
