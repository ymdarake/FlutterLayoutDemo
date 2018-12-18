import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/HomeScreen.dart';
import 'screens/MessagesScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/CommentsScreen.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/messages': (context) => MessagesScreen(),
        '/profile': (context) => ProfileScreen(),
        '/comments': (context) => CommentsScreen(),
      },
    );
  }
}
