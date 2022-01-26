import 'package:flutter/material.dart';
import 'package:ppc/Pages/Admin/Create_Plan.dart';
import 'package:ppc/Pages/Admin/PlanList.dart';
import 'package:ppc/Pages/Admin/UserList.dart';
import 'package:ppc/Pages/Admin/WithdrwList.dart';

class SideNavigation extends StatefulWidget {
  const SideNavigation({Key? key}) : super(key: key);

  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  @override
  int _selectedIndex = 0;
  bool Bar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cash Flow",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              if (Bar == true) {
                setState(() {
                  Bar = false;
                });
              } else {
                setState(() {
                  Bar = true;
                });
              }
            },
            icon: const Icon(
              Icons.menu,
            )),
      ),
      body: Row(
        children: <Widget>[
          Bar
              ? NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('Create Plan'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.bookmark_border),
                      selectedIcon: Icon(Icons.book),
                      label: Text('Plans'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.star),
                      label: Text('Panding\nWithdraw'),
                    ),
                                        NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Users'),
                    ),
                                        NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.payment),
                      label: Text('Deposit'),
                    ),
                  ],
                )
              : VerticalDivider(thickness: 1, width: 1),
          const VerticalDivider(thickness: 0.2, width: 1),
          // This is the main content.
          Expanded(
              child: _selectedIndex == 0
                  ? WithdrawList()
                  : _selectedIndex == 1
                      ? UserList()
                      : _selectedIndex == 2
                          ? PlanList()
                          : _selectedIndex == 3
                              ? WithdrawList()
                              : Create_Plan()
              // Center(
              //   child: Text('selectedIndex: $_selectedIndex'),
              // ),
              )
        ],
      ),
    );
  }
}
