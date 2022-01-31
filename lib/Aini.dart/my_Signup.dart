import 'package:flutter/material.dart';

import 'constants.dart';

class MySignUp extends StatefulWidget {
    const MySignUp({Key? key}) : super(key: key);

  @override
  _MySignUpState createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
    final TextEditingController useremailcontroller =
      TextEditingController();
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
                      children: [
                        Text(
                          "New Account",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          "Sign up and get started",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    // child: RichText(
                    //   text: TextSpan(
                    //       text: 'Welcome!',
                    //       style: TextStyle(color: Colors.white, fontSize: 30),
                    //       // ignore: prefer_const_literals_to_create_immutables
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: '\nSign in and get started',
                    //           style: TextStyle(color: Colors.white, fontSize: 18),
                    //         )
                    //       ]),
                    // ),
                  )),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //Add logo
                    CustomText(txt: "Email"),
                    CustomTextField(
                      txt: "your email here",
                      controller: useremailcontroller.text,
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                    CustomText(txt: "User Name"),
                    CustomTextField(
                      txt: "your User Name here",
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 70.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(txt: "First Name"),
                            CustomTextField(
                              txt: "your First Name here",
                              width: MediaQuery.of(context).size.width * 0.42,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(txt: "Last Name"),
                            CustomTextField(
                              txt: "your Last Name here",
                              width: MediaQuery.of(context).size.width * 0.42,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomText(txt:"Password"),
                    CustomTextField(txt: "your password here",
                      width: MediaQuery.of(context).size.width*1,
                      icon: Icons.remove_red_eye_sharp,),
                    CustomText(txt:"Phone"),
                    CustomTextField(txt: "your password here",
                      width: MediaQuery.of(context).size.width*1,),
                    CustomButton(
                      btnFunction: () {},
                      btnTxt: "Sign Up",
                      btnHeight: 60.0,
                      btnWidth: MediaQuery.of(context).size.width * 1,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 50.0),
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      btnFunction: () {},
                      btnTxt: "Sign In",
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
    paint.color = Colors.deepPurple;
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
