import 'package:flutter/material.dart';

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Align(
//      padding: EdgeInsets.all(32.0),
      alignment: Alignment.center,
      heightFactor: 4.0,
      widthFactor: 2.0,
      child: Text(
        '文本演示',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),
      ),
    );

    Widget contentSection = Container(
      padding: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
      child: Text(
        '''
        这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。
        这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。
        这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。这里是一段长文本，非常非常的长，长到难以想象。
        ''',
        style: TextStyle(fontSize: 12.0),
      ),
    );

    Widget rating = Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
            ],
          ),
          Text(
            '170 评论',
            style: TextStyle(
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

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              timeStr,
              style: TextStyle(
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

    return Scaffold(
      body: ListView(
        children: <Widget>[
          titleSection,
          contentSection,
          rating,
          buttonSection,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Image.asset('assets/image/lake.jpg')),
              Expanded(child: Image.asset('assets/image/lake.jpg')),
              Expanded(child: Image.asset('assets/image/lake.jpg')),
            ],
          )
        ],
      ),
    );
  }
}
