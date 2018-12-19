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
          GestureDetector(
            child: Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            onLongPress: () {
              print('Long press detected!');
              _askedToLead();
            },
            onLongPressUp: () {
              print('long press up detected!');
            },
            onHorizontalDragStart: (DragStartDetails e) {
              print('Horizontal drag start detected!');
              print(e.globalPosition);
              print(e.globalPosition.dx);
              print(e.globalPosition.dy);
            },
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

  /// https://docs.flutter.io/flutter/material/SimpleDialog-class.html
  Future<void> _askedToLead() async {
    switch (await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, 1); },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, 2); },
                child: const Text('State department'),
              ),
            ],
          );
        }
    )) {
      case 1:
        print(1);
        break;
      case 2:
        print(2);
        break;
    }
  }

}
