import 'package:flutter/material.dart';
import 'package:ppc/Pages/Admin/Create_Plan.dart';
import 'package:ppc/Pages/Admin/DepositList.dart';
import 'package:ppc/Pages/Admin/P_DepositList.dart';
import 'package:ppc/Pages/Admin/P_WithdrawList.dart';
import 'package:ppc/Pages/Admin/PlanList.dart';
import 'package:ppc/Pages/Admin/UserList.dart';
import 'package:ppc/Pages/Admin/WithdrawList.dart';

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
                      icon: Icon(Icons.create_new_folder_outlined),
                      selectedIcon: Icon(Icons.create_new_folder),
                      label: Text('Create Plan'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.gradient),
                      selectedIcon: Icon(Icons.gradient_outlined),
                      label: Text('Plans'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Users\nList'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.wallet_giftcard),
                      selectedIcon: Icon(Icons.wallet_giftcard_outlined),
                      label: Text('Panding\nWithdraw'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.account_balance_wallet),
                      selectedIcon: Icon(Icons.account_balance_wallet_outlined),
                      label: Text('Withdraw\nList'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.document_scanner),
                      selectedIcon: Icon(Icons.star),
                      label: Text('Panding\nDeposit'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.star),
                      label: Text('Deposit\nList'),
                    ),
                  ],
                )
              : VerticalDivider(thickness: 1, width: 1),
          const VerticalDivider(thickness: 0.2, width: 1),
          // This is the main content.
          Expanded(
              child: _selectedIndex == 0
                  ? Create_Plan()
                  : _selectedIndex == 1
                      ? PlanList()
                      : _selectedIndex == 2
                          ? UserList()
                          : _selectedIndex == 2
                              ? P_WithdrawList()
                              : _selectedIndex == 3
                                  ? WithdrawList()
                                  : _selectedIndex == 4
                                      ? P_DepositList()
                                      : _selectedIndex == 5
                                          ? DepositList()
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
