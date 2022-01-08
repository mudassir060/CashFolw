// ignore_for_file: non_constant_identifier_names, file_names, must_be_immutable

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Map UserData;

  const ProfilePage({
    Key? key,
    required this.UserData,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Map data = {};
  String Name = "Null";
  String Email = "Null";
  String photoUrl =
      "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1214428300?k=6&m=1214428300&s=170667a&w=0&h=hMQs-822xLWFz66z3Xfd8vPog333rNFHU6Q_kc9Sues=";
  String PhoneNo = "03XX-XXXXXXX";
  String About = "I am Muslim";

  @override
  Widget build(BuildContext context) {
    double maxWidth = 600;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(photoUrl),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              UserDataField(
                icon: Icons.account_circle_outlined,
                titleText: "User Name",
                text: widget.UserData['Name'],
              ),
              UserDataField(
                icon: Icons.email_outlined,
                titleText: "Email",
                text: widget.UserData['email'],
              ),
              UserDataField(
                icon: Icons.phone,
                titleText: "Phone No",
                text: widget.UserData['phoneNo'],
              ),
          ],
        ),
            )),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
          constraints:const  BoxConstraints(maxWidth: 600),
          height: 1,
          color: Colors.black12),
    );
  }
}

class Data extends StatefulWidget {
  final IconData icon;
  final String titel;
  final String subtitel;
  const Data({
    Key? key,
    required this.icon,
    required this.titel,
    required this.subtitel,
  }) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: Colors.blue,
          size: 40,
        ),
        Container(
          constraints:const  BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titel,
                  textAlign: TextAlign.left,
                  style:const  TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  widget.subtitel,
                  textAlign: TextAlign.left,
                  style:const  TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}





class UserDataField extends StatelessWidget {
  IconData icon;
  String titleText;
  String text;

  UserDataField(
      {Key? key, required this.icon, required this.titleText, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black54,
                size: 40,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: maxWidth),
                // width: MediaQuery.of(context).size.width /   1.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}