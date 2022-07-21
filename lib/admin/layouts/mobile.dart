import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    Key? key,
    required this.screens,
    required this.navigationIndex,
    required this.onNavigationTap,
  }) : super(key: key);

  final List<Widget> screens;
  final int navigationIndex;
  final void Function(int)? onNavigationTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        currentIndex: navigationIndex,
        onTap: onNavigationTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.handyman),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Loans',
          )
        ],
      ),
    );
  }
}
