// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ppc/Bloc/AppBar.dart';

class PostAd extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const PostAd(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);

  @override
  _PostAdState createState() => _PostAdState();
}

class _PostAdState extends State<PostAd> {
  @override
  Widget build(BuildContext context) {
            final appBarBloc = AppBarBloc();
    if (kDebugMode) {
      print({
        "PostAd Page",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
        appBarBloc.eventSink.add(AppBarAction.Profile);

    }

    return  StreamBuilder(
            stream: appBarBloc.TitelStream,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                "${snapshot.data}",
                style: const TextStyle(color: Colors.black),
              );
            },
          )
      ;
  }
}

