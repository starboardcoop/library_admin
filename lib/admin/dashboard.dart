import 'package:flutter/material.dart';
import 'package:library_admin/admin/layouts/desktop.dart';
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

  void onNavigationTapped(int value) {
    setState(() => _currentIndex = value);
  }

  Widget get _mobileLayout {
    return MobileLayout(
      screens: _screens,
      navigationIndex: _currentIndex,
      onNavigationTap: onNavigationTapped,
    );
  }

  Widget get _desktopLayout {
    return DesktopLayout(
      screens: _screens,
      navigationIndex: _currentIndex,
      onNavigationTap: onNavigationTapped,
    );
  }
}
