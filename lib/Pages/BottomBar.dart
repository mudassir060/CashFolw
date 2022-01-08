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

import 'package:flutter/material.dart';
import 'package:ppc/Api/login.dart';
import 'package:ppc/Api/register.dart';
import 'package:ppc/Pages/HomePage.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    const Login(),
    const Registration(),
    const HomePage(Name: "Name", Email: "Email", PhoneNo: "PhoneNo", UID: "UID"),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      // appBar: AppBar(
      //   title: Text("BottomNavigationBar", style: TextStyle(color: Colors.white)),
      //   backgroundColor: Colors.deepPurple,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text("Messages")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Profile")),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
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
