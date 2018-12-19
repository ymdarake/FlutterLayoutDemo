import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/BottomNavigationBar.dart' as NavBar;
import '../routes.dart';
import '../model/News.dart';
import '../api/NewsApi.dart';
import '../screens/WebViewScreen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessagesScreenState();
  }
}

class MessagesScreenState extends State<MessagesScreen> {
  List<News> _newsList = [];

  @override
  void initState() {
    super.initState();
    refreshHandler();
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
