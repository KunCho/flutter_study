import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('文本输入框：',style: TextStyle(
            fontSize: 15.5,height: 1.2,color: Colors.blue
          ),textAlign: TextAlign.left,),
          TextField()
        ],
      ),
    );
  }

}