import 'package:flutter/material.dart';

import 'main.dart';

BottomNavigationBar bottomBar(context){
  List <BottomNavigationBarItem> _bottomBar = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_box_outlined),
      label: 'About',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.help),
      label: 'Help',
    ),
  ];

  return BottomNavigationBar(
    items: _bottomBar,
    iconSize: 20,
    selectedItemColor: Colors.deepPurpleAccent,
    unselectedItemColor: Colors.blueGrey,
    onTap: (index){
      List<Widget> screens = [
        Home(), About(), Help()
      ];

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => screens[index]));
    },
  );
}