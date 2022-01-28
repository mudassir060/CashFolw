import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Widget/Color.dart';

class Fee_Setting extends StatefulWidget {
  const Fee_Setting({Key? key}) : super(key: key);

  @override
  _Fee_SettingState createState() => _Fee_SettingState();
}
    final Stream<QuerySnapshot> _FeeStream = FirebaseFirestore.instance
        .collection('Fees & Bonus')
        .snapshots();
var _currencies = [
  "Withdraw",
  "Deposit",
  "Transfer",
  "Reffel",
];
var _currentSelectedValue;

class _Fee_SettingState extends State<Fee_Setting> {
  String SelectLevel = "";
  final TextEditingController Feecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(SelectLevel);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kToDark,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Container(
                    //     width: 300,
                    //     height: 400,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(12.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           _space,
                    //           const Text(
                    //             "Fees Setting",
                    //             style: TextStyle(
                    //                 fontSize: 25,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Color(0xff7530fb)),
                    //           ),
                    //           _space,
                    //           _Line,
                    //           _space,
                    //           const Text(
                    //             "Select Level",
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //           ),
                    //           FormField<String>(
                    //             builder: (FormFieldState<String> state) {
                    //               return InputDecorator(
                    //                 decoration: const InputDecoration(
                    //                     hintText: 'Select Option',
                    //                     border: OutlineInputBorder()),
                    //                 isEmpty: _currentSelectedValue == '',
                    //                 child: DropdownButtonHideUnderline(
                    //                   child: DropdownButton<String>(
                    //                     value: _currentSelectedValue,
                    //                     isDense: true,
                    //                     onChanged: (value) => {
                    //                       _currentSelectedValue = value,
                    //                       state.didChange(value),
                    //                       setState(() {
                    //                         SelectLevel = _currentSelectedValue;
                    //                       })
                    //                     },
                    //                     items: _currencies.map((String value) {
                    //                       return DropdownMenuItem<String>(
                    //                         value: value,
                    //                         child: Text(value),
                    //                       );
                    //                     }).toList(),
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //           _space,
                    //           const Text(
                    //             "Fees%",
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //           ),
                    //           TextField(
                    //             controller: Feecontroller,
                    //             decoration: const InputDecoration(
                    //                 border: OutlineInputBorder(),
                    //                 // labelText: 'Email',
                    //                 hintText: ""),
                    //           ),
                    //           _space,
                    //           Center(
                    //             child: ElevatedButton(
                    //               child: const Padding(
                    //                 padding: EdgeInsets.only(left: 70, right: 70),
                    //                 child: Text(
                    //                   'Save',
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 15,
                    //                   ),
                    //                 ),
                    //               ),
                    //               onPressed: () async {
                    //                 FirebaseFirestore firestore =
                    //                     FirebaseFirestore.instance;

                    //                 if (int.parse(Feecontroller.text).runtimeType ==
                    //                     int) {
                    //                   await firestore
                    //                       .collection("Fees & Bonus")
                    //                       .doc(SelectLevel)
                    //                       .set({
                    //                     "Level": SelectLevel,
                    //                     "Value": int.parse(Feecontroller.text)
                    //                   });
                    //                   AlertDialog alert = const AlertDialog(
                    //                     title: Center(child: Text("Done")),
                    //                   );
                    //                   showDialog(
                    //                     context: context,
                    //                     builder: (BuildContext context) {
                    //                       return alert;
                    //                     },
                    //                   );
                    //                 } else {
                    //                    AlertDialog alert = const AlertDialog(
                    //                     title: Center(child: Text("Fill all filed")),
                    //                   );
                    //                   showDialog(
                    //                     context: context,
                    //                     builder: (BuildContext context) {
                    //                       return alert;
                    //                     },
                    //                   );
                    //                 }
                    //               },
                    //               style: ButtonStyle(
                    //                 shape: MaterialStateProperty.all<
                    //                     RoundedRectangleBorder>(
                    //                   RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(18.0),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: const BorderRadius.only(
                    //           topLeft: Radius.circular(10),
                    //           topRight: Radius.circular(10),
                    //           bottomLeft: Radius.circular(10),
                    //           bottomRight: Radius.circular(10)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.5),
                    //           spreadRadius: 5,
                    //           blurRadius: 7,
                    //           offset:
                    //               const Offset(0, 3), // changes position of shadow
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                color: Colors.black12,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 200,
                                          child: const Text("Level",
                                              style: TextStyle(
                                                  color: Color(0xff7530fb),
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          width: 200,
                                          child: const Text(
                                            "Fee",
                                            style: TextStyle(
                                                color: Color(0xff7530fb),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Center(
                          child: StreamBuilder<QuerySnapshot>(
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
                                height: vhight,
                                child: ListView(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  controller: ScrollController(),
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    Map<String, dynamic> data =
                                        document.data()! as Map<String, dynamic>;
                                    Index++;
                                    return Ro_w(titel: '${data['Level']}', value: '${data['_Price']}');
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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
Widget get _Line => Container(
      color: Colors.black26,
      width: 300,
      height: 1,
    );

class Ro_w extends StatelessWidget {
  final String titel;
  final String value;
  const Ro_w({Key? key, required this.titel, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(width: 200, child: Text("$titel")),
              Container(width: 200, child: Text("$value")),
            ],
          ),
        ),
      ),
    );
  }
}
