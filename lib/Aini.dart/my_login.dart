import 'package:flutter/material.dart';

import 'constants.dart';

class MySignIn extends StatefulWidget {
  const MySignIn({Key? key}) : super(key: key);

  @override
  _MySignInState createState() => _MySignInState();
}

class _MySignInState extends State<MySignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            painter: CurvePainter2(),
            child: ListView(shrinkWrap: true, children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: const [
                        Text("Welcome!",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text("Sign in and get started",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  )),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome!",style: TextStyle(color: Colors.white,fontSize: 30.0),),
                    Text("Sign in and get started",style: TextStyle(color: Colors.white,),),
                    //Add logo
                    SubTxt(txt:"Email"),
                    CustomTextField(txt: "your email here",
                      width: MediaQuery.of(context).size.width*1,),
                    SubTxt(txt:"Password"),
                    CustomTextField(txt: "your password here",
                      width: MediaQuery.of(context).size.width*1,
                      icon: Icons.remove_red_eye_sharp,),
                    Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          btnFunction: () {},
                          btnText: "Forgot Password",
                          btnTxtClr: Colors.grey,
                        )),
                    CustomButton(
                      btnFunction: ()  {},
                      btnTxt: "Sign In",
                      btnHeight: 60.0,
                      btnWidth: MediaQuery.of(context).size.width * 1,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top:80.0,bottom: 10.0,left: 50.0),
                        child: Text("Don't have an account?",style: TextStyle(color: Colors.deepPurple,),),
                      ),
                    ),
                    CustomButton(
                      btnFunction: ()  {},
                      btnTxt: "Sign Up",
                      btnHeight: 50.0,
                      btnWidth: MediaQuery.of(context).size.width * 0.90,
                    ),

                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}



class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color =  Colors.deepPurple;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 4, size.height / 6, size.width, size.height * 0.15);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
