
import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _Demo4State createState() => _Demo4State();
}

class _Demo4State extends State<FavoriteWidget> {
  bool _isFavourited = true;
  int _favoriteCount = 100;

  void _toggleFavorite() {
    setState(() {
      if (_isFavourited) {
        _favoriteCount -= 1;
        _isFavourited = false;
      } else {
        _favoriteCount += 1;
        _isFavourited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(icon: _isFavourited?new Icon(Icons.star):new Icon(Icons.star_border),color: Colors.red[500], onPressed: _toggleFavorite),
        ),
        SizedBox(
          width: 30,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}
