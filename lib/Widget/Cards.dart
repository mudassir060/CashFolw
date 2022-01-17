import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final IconData icon_Data;
  final String titel;
  final String No;

  const Cards(
      {Key? key,
      required this.titel,
      required this.icon_Data,
      required this.No})
      : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Container(
            width: vwidth - 15,
            height: vwidth / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // IconButton(onPressed: (){}, icon: const Icon(Icons.icecream_outlined)),
                Icon(
                  widget.icon_Data,
                  color: Colors.blueAccent.shade200,
                  size: vwidth / 3,
                ),
                Text(
                  "${widget.titel} : ${widget.No}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
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
            )),
      ),
    );
  }
}

