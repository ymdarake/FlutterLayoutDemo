import 'package:flutter/material.dart';
import 'routes.dart';
//import 'package:flutter/rendering.dart';

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
      onGenerateRoute: router
    );
  }
}
