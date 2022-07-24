import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({
    Key? key,
    required this.screens,
    required this.navigationIndex,
    required this.onNavigationTap,
  }) : super(key: key);

  final List<Widget> screens;
  final int navigationIndex;
  final void Function(int)? onNavigationTap;

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
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
            selectedIndex: widget.navigationIndex,
            onDestinationSelected: widget.onNavigationTap,
          ),
          Expanded(
            child: IndexedStack(
              index: widget.navigationIndex,
              children: widget.screens,
            ),
          ),
        ],
      ),
    );
  }
}
