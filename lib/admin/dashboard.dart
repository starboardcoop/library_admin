import 'package:flutter/material.dart';
import 'package:library_admin/admin/layouts/mobile.dart';

import 'inventory/pages/inventory.dart';
import 'loans/pages/loans.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const InventoryPage(),
    const LoansPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 701) {
          return _mobileLayout;
        } else {
          return _desktopLayout;
        }
      },
    );
  }

  Widget get _mobileLayout {
    return MobileLayout(
      screens: _screens,
      navigationIndex: _currentIndex,
      onNavigationTap: (value) {
        setState(() => _currentIndex = value);
      },
    );
  }

  Widget get _desktopLayout {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            elevation: 8,
            backgroundColor: Colors.blueGrey,
            labelType: NavigationRailLabelType.selected,
            selectedLabelTextStyle: const TextStyle(
              color: Colors.white,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.handyman),
                label: Text('Inventory'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.handshake),
                label: Text('Loans'),
              ),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: (value) =>
                setState(() => _currentIndex = value),
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }
}
