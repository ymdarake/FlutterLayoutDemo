import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/BottomNavigationBar.dart' as NavBar;
import '../routes.dart';

class CommentsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommentsScreenState();
  }
}
class CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Comments Screen',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  )
                ],
              )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          titleSection,
        ],
      ),
      bottomNavigationBar: NavBar.build(context, 3, ((index) {
        if (index != 3) {
          Navigator.pushNamed(context, ROUTES[index]);
        }
      })),
    );
  }
}
