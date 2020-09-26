import 'package:flutter/material.dart';

class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyDemo3(title: 'Demo3');
  }
}

class MyDemo3 extends StatefulWidget {
  final String title;

  MyDemo3({this.title});

  //MyDemo3({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyDemo3State();
}

class _MyDemo3State extends State<MyDemo3> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle one');
    } else {
      return MaterialButton(
        onPressed: () {},
        child: Text('toggle Two'),
      );
    }
  }
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
    return Scaffold(
      appBar: AppBar(
        title: Text('修改布局组件的值'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              child: IconButton(icon: _isFavourited? Icon(Icons.star): Icon(Icons.star_border),color: Colors.red[500], onPressed: _toggleFavorite),
            ),
            SizedBox(
              width: 30,
              child: Text('$_favoriteCount'),
            ),
            _getToggleChild()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        child: Icon(Icons.update),
      ),
    );
  }
}
