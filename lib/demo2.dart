import 'package:flutter/material.dart';

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Align(
//      padding: EdgeInsets.all(32.0),
      alignment: Alignment.center,
      heightFactor: 4.0,
      widthFactor: 2.0,
      child: new Text(
        '文本演示',
        style: new TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),
      ),
    );

    Widget contentSection = new Container(
      padding: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
      child: new Text(
        '''
        这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。
        这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。
        这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。
        ''',
        style: new TextStyle(fontSize: 12.0),
      ),
    );

    Widget rating = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              new Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              new Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              new Icon(
                Icons.star,
                color: Colors.black,
              ),
              new Icon(
                Icons.star,
                color: Colors.black,
              ),
            ],
          ),
          new Text(
            '170 评论',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label, String timeStr) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              timeStr,
              style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.kitchen, 'PREP', '25 min'),
          buildButtonColumn(Icons.timer, 'COOK', '1 h'),
          buildButtonColumn(Icons.restaurant, 'FEEDS', '4~6'),
        ],
      ),
    );

    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          titleSection,
          contentSection,
          rating,
          buttonSection,
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(child: new Image.asset('assets/image/lake.jpg')),
              new Expanded(child: new Image.asset('assets/image/lake.jpg')),
              new Expanded(child: new Image.asset('assets/image/lake.jpg')),
            ],
          )
        ],
      ),
    );
  }
}
