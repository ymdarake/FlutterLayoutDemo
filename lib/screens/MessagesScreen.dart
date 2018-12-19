import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/BottomNavigationBar.dart' as NavBar;
import '../routes.dart';
import '../model/News.dart';
import '../api/NewsApi.dart';
import '../screens/WebViewScreen.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessagesScreenState();
  }
}

class MessagesScreenState extends State<MessagesScreen> {
  List<News> _newsList = [];

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    refreshHandler();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _buildDialog(context, "onMessage");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _buildDialog(context, "onLaunch");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _buildDialog(context, "onResume");
      }
    );

    _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: false,alert: true,badge: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("Push Messaging tokem: $token");
    });
    // when sending via REST API, specify '/topics/all'.
    _firebaseMessaging.subscribeToTopic("all");
  }
  _buildDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Message: $message'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CLOSE'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: const Text('SHOW'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        );
      }
    );
  }

  Future<void> refreshHandler() {
    return NewsApi().fetchNewsList().then((newsList) {
      setState(() {
        _newsList = newsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pull to refresh')),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: _newsList.length,
          itemBuilder: (context, i) {
            var n = _newsList[i];
            return GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WebViewScreen(url: n.link);
                    }
                  )
                );
              },
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[500],
                    width: 0.5,
                  )
                ),
                child: ListTile(
                  title: Text(n.title),
                  subtitle: Text(n.date),
                )
              )
            );
          },
        ),
        onRefresh: refreshHandler,
      ),
      bottomNavigationBar: NavBar.build(context, 1, ((index) {
        if (index != 1) {
          Navigator.pushNamed(context, ROUTES[index]);
        }
      })),
    );
  }
}
