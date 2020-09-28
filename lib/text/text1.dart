import 'package:flutter/material.dart';

class Text1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('data'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text('test1',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 15),),
            Text('test2'),
            Text('test3'),
            Text('test3'),
//            Container(padding: EdgeInsets.fromLTRB(left, top, right, bottom),)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          mainAxisSize: ma,
        ),
      ),

    );
  }
  
}