import 'package:flutter/material.dart';

class CommonBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;
  const CommonBottomBar(
      {required this.items, required this.currentIndex, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType
          .fixed, // Adjust for fixed or shifting behavior
      selectedItemColor: Colors.red, // Customize colors
      unselectedItemColor: Colors.grey,
    );
  }
}
