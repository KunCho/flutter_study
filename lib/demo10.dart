import 'package:flutter/material.dart';

class Demo10 extends StatelessWidget {
  Demo10({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,
            tooltip: 'Navigation menu',
          ),
          new Expanded(child: title),
          new IconButton(icon: new Icon(Icons.search), onPressed: null,tooltip: 'Search',)
        ],
      ),
    );
  }
}

class Demo10Scaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new Demo10(
            title: new Text('Demo10 title',style: Theme.of(context).primaryTextTheme.title,),
          ),
          new Expanded(child: new Center(
            child: new Text('Center world'),
          ))
        ],
      ),
    );
  }
  
}
