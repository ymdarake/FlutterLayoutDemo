import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/HomeScreen.dart';
import 'screens/MessagesScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/CommentsScreen.dart';
import 'pageroute/SlideRightRoute.dart';

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
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return SlideRightRoute(
                widget: HomeScreen()
            );
          case '/messages':
            return SlideRightRoute(
                widget: MessagesScreen()
            );
          case '/profile':
            return SlideRightRoute(
              widget: ProfileScreen()
            );
          case '/comments':
            return SlideRightRoute(
                widget: CommentsScreen()
            );
        }
        assert(false);
      }
    );
  }
}
