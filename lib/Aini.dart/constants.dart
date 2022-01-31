import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final txt;
  final icon;
  final width;
  final controller;
  const CustomTextField(
      {Key? key, this.txt, this.icon, this.width, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: width,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.grey[300],
            height: 2.0,
          ),
          hintText: txt,
        ),
      ),
    );
  }
}

class SubTxt extends StatelessWidget {
  final txt;

  const SubTxt({Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 35.0, bottom: 8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
            children: <TextSpan>[
              TextSpan(
                text: txt,
              ),
              TextSpan(
                  text: '*',
                  style: new TextStyle(color: Colors.red, fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final txt;

  const CustomText({Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 35.0, bottom: 8.0),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

//Clickable text /Text Button
class CustomTextButton extends StatelessWidget {
  final btnFunction;
  final btnText;
  final btnTxtClr;

  const CustomTextButton(
      {Key? key, this.btnFunction, this.btnText, this.btnTxtClr})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: btnFunction,
        child: Text(
          btnText,
          style: TextStyle(color: btnTxtClr),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final btnTxt;
  final btnFunction;
  final btnWidth;
  final btnHeight;

  const CustomButton(
      {Key? key, this.btnTxt, this.btnFunction, this.btnWidth, this.btnHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth,
      height: btnHeight,
      child: FlatButton(
        onPressed: btnFunction,
        color: Colors.deepPurple,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          btnTxt,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
