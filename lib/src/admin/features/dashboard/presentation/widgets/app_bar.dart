import 'package:flutter/material.dart';
import 'package:sneakers/src/user/dashboard.dart';

AppBar AppBarPage(GlobalKey<ScaffoldState> scaffoldKey, String title, BuildContext context) {
  
  void logout() {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  return AppBar(
    leading: IconButton(
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
      icon: Icon(Icons.menu),
    ),
    title: Text(title),
    actions: [
      PopupMenuButton<String>(
        onSelected: (String value) {
          if (value == 'logout') {
            logout();
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'profile',
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text('Profile'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'settings',
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text('Settings'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              title: Text('Logout'),
            ),
          ),
        ],
      )
    ],
  );
}
