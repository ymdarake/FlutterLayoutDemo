import 'package:flutter/material.dart';
import 'pageroute/SlideRightRoute.dart';
import 'screens/HomeScreen.dart';
import 'screens/MessagesScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/CommentsScreen.dart';

const ROUTES = ['/', '/messages', '/profile', '/comments'];
Route<dynamic> router (RouteSettings settings) {
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
    default:
      return SlideRightRoute(
        widget: HomeScreen()
      );
  }
}
