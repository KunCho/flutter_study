
import 'package:flutter/material.dart';

class LimitedBoxIntro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LimitedBox的简单使用'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 100.0,
          ),
          LimitedBox(
            maxWidth: 150.0,
            child: Container(
              color: Colors.blue,
              width: 250.0,
            ),
          ),
        ],
      ),
    );
  }

}