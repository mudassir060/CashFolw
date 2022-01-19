// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Bloc/AppBar.dart';

class Withdraw extends StatefulWidget {
  final Map UserData;

  const Withdraw(
      {Key? key,required this.UserData,})
      : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

final TextEditingController WithdrawController = TextEditingController();

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
     if (kDebugMode) {
      print({
        "Withdraw Page",
        "${widget.UserData}"
      });
    }
    final appBarBloc = AppBarBloc();
    appBarBloc.eventSink.add(AppBarAction.PostADS);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
                         appBar: AppBar(
            title: const Text(
                  "Withdraw",
                  style: TextStyle(color: Colors.white),
                ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                 Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
          ),
        body: Center(
          child: Container(
            width: vwidth - 50,
            height: vhight - 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Fund Withdrawal",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                _space,
                _space,
                _space,
                const Text(
                  "Get Your Fund To your account",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                _space,
                _space,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Enter Withdraw Amount",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: WithdrawController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter amount that you want withdraw"),
                    ),
                    _space,
                    const Text(
                      "Email ID",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: WithdrawController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "abc@gmail.com",
                      ),
                    ),
                    _space,
                    const Text(
                      "Account 4 digit PIN",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: WithdrawController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "200-5000"),
                    ),
                    _space,
                    ElevatedButton(
                      child: const Text(
                        'Withdraw Now!',
                        // style: TextStyle(fontSize: 10.0),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget get _space => const SizedBox(
      height: 10,
    );
