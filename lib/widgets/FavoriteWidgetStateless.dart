import 'package:flutter/material.dart';

class FavoriteWidgetStateless extends StatelessWidget {
  Function onTapped;
  bool isFavorited;
  int favoriteCount;

  FavoriteWidgetStateless(
      {Key key, this.onTapped, this.isFavorited, this.favoriteCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red[500],
            onPressed: onTapped,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$favoriteCount'),
          ),
        ),
      ],
    );
  }
}
