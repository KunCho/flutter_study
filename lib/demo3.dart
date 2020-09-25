import 'package:flutter/material.dart';

class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Demo3',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: MyDemo3(title: 'Demo3'),
    );
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
    return new Scaffold(
      appBar: AppBar(
        title: Text('修改布局组件的值'),
        centerTitle: true,
      ),
      body: new Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(0),
              child: new IconButton(icon: _isFavourited?new Icon(Icons.star):new Icon(Icons.star_border),color: Colors.red[500], onPressed: _toggleFavorite),
            ),
            new SizedBox(
              width: 30,
              child: new Text('$_favoriteCount'),
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
