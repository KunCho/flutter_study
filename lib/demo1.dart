import 'package:flutter/material.dart';

import 'commponent/pagination.dart';
import 'demo4.dart';
import 'demo5.dart';
import 'demo7.dart';

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Oedchinen Lake Campground',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text('Kandersteg,Switzerland',style: TextStyle(color: Colors.grey[500]),)
              ],
            ),
          ),
         /* new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),*/FavoriteWidget(),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon,String label){
//      Color color = Theme.of(context).primaryColor;
      Color color = Colors.green[500];

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
                color: color
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
        中文文本中文文本中文文本中文文本中文文本中文文本中文文本
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return Scaffold(
//        appBar: new AppBar(
//          title: new Text('欢迎页'),
//        ),
      body: ListView(
        children: <Widget>[
          Pagination(),
          titleSection,
          buttonSection,
          textSection,
          TapBoxA(),
          ParentWidget(),
//            new TapCParentWidget(),
        ],
      ),
    );
  }

}