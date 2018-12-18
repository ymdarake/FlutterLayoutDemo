import 'package:flutter/material.dart';

typedef TabTapHandler = void Function(int index);

Widget build(BuildContext context, int index, TabTapHandler onTabTapped) {
  return Hero(
      tag: 'NavBar',
      child: Container(
        height: 60.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: onTabTapped, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text('Messages'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              title: Text('Comments')
            ),
          ]
        )
      )
  );
}
