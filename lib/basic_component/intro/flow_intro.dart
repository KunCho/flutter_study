
import 'package:flutter/material.dart';

import 'test_flow_delegate.dart';

class FlowIntro extends StatelessWidget{
  static const width=80.0;
  static const height=60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
        children: <Widget>[
          Container(width: width, height: height, color: Colors.yellow,),
          Container(width: width, height: height, color: Colors.green,),
          Container(width: width, height: height, color: Colors.red,),
          Container(width: width, height: height, color: Colors.black,),
          Container(width: width, height: height, color: Colors.blue,),
          Container(width: width, height: height, color: Colors.lightGreenAccent,),
        ],
      ),
    );
  }

}