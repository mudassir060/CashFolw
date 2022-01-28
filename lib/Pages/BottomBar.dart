// import 'package:diceeapp/dice1.dart';
// import 'package:diceeapp/dice2.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// class DiceHome extends StatefulWidget {
//   @override
//   _DiceHomeState createState() => _DiceHomeState();
// }

// class _DiceHomeState extends State<DiceHome> {
//   // ignore: non_constant_identifier_names
// //  var left_image = Random().nextInt(5);
//   // ignore: non_constant_identifier_names
//   var left_image = 1;
//   // ignore: non_constant_identifier_names
//   var right_image = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dice Game'),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.lightBlue[50],
//       body: Center(
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               // ignore: deprecated_member_use
//               child: FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     left_image = Random().nextInt(6) + 1;
//                   });

//                   print("Value $left_image");
//                 },
//                 child: Image.asset('images/dice$left_image.png'),
//               ),
//             ),
//             Expanded(
//               // ignore: deprecated_member_use
//               child: FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     right_image = Random().nextInt(6) + 1;
//                   });
//                   print("DICE 02 Value is $right_image");
//                 },
//                 child: Image.asset('images/dice$right_image.png'),
//               ),
//             ),
//           ],
//         ),
//       ),

// bottomNavigationBar: MyBottomBarDemo(),
//     );
//   }
// }

// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppc/Pages/Dashboard.dart';
import 'package:ppc/Pages/HomePage.dart';
import 'package:ppc/Pages/MLM/Home.dart';
import 'package:ppc/Pages/MLM/InvestPlan.dart';
import 'package:ppc/Pages/Profile.dart';
import 'package:ppc/Widget/Color.dart';

class BottomBar extends StatefulWidget {
  final Map UserData;
  const BottomBar({Key? key, required this.UserData}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // String Titel = "";
  // final appBarBloc = AppBarBloc();
  @override
  Widget build(BuildContext context) {
    List<Widget> tabPages = [
      InvestPlan(UserData: widget.UserData),
      Home(UserData: widget.UserData),
      Dashboard(UserData: widget.UserData),
      ProfilePage(UserData: widget.UserData),
    ];
    if (kDebugMode) {
      print({"Bottom Bar", widget.UserData});
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: kToDark,
        ),
        home: Scaffold(
          // appBar: AppBar(
          //   title: StreamBuilder(
          //     stream: appBarBloc.TitelStream,
          //     initialData: 0,
          //     builder: (context, snapshot) {
          //       //  return Text("$_counter");
          //       return Text(
          //         "${snapshot.data}",
          //         style: const TextStyle(color: Colors.white),
          //       );
          //     },
          //   ),
          //   centerTitle: true,
          //   leading: IconButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 BottomBar(UserData: widget.UserData),
          //           ),
          //         );
          //       },
          //       icon: const Icon(
          //         Icons.arrow_back,
          //       )),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _pageIndex,
            onTap: onTabTapped,
              type: BottomNavigationBarType.fixed, // Fixed 
  backgroundColor: Colors.white, // <-- This works for fixed
  selectedItemColor: Colors.purple,
  unselectedItemColor: Color(0xff7530fb),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,  ),
                  title: Text(
                    "Home",
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard,  ),
                  title: Text(
                    "Invest Plan",
                    style: TextStyle( ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard,  ),
                  title: Text(
                    "My Invest",
                    style: TextStyle( ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,  ),
                  title: Text(
                    "Dashboard",
                    style: TextStyle( ),
                  )),
            ],
          ),
          body: PageView(
            children: tabPages,
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}





// class MyNavigationBar extends StatefulWidget {
//   @override
//   _MyNavigationBarState createState() => _MyNavigationBarState();
// }

// class _MyNavigationBarState extends State<MyNavigationBar> {
  // int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home',  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Dice 1', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Dice 2', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Flutter BottomNavigationBar Example'),
//       //     backgroundColor: Colors.green
//       // ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//             backgroundColor: Colors.green
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//             backgroundColor: Colors.yellow
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text('Profile'),
//             backgroundColor: Colors.blue,
//           ),
//         ],
//         type: BottomNavigationBarType.shifting,
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         iconSize: 40,
//         onTap: _onItemTapped,
//         elevation: 5
//       ),
//     );
//   }
// }
