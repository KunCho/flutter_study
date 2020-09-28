import 'package:flutter/material.dart';

class OffstageIntro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OffstageIntroState();
  }
}

class _OffstageIntroState extends State<OffstageIntro>{
  bool offstage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offstage的简单使用'),
      ),
      body: Column(
        children: <Widget>[
          Text('控制组件显示隐藏'),
          Offstage(
            offstage: offstage,
            child: Container(color: Colors.blue, height: 100.0),
          ),
          RaisedButton(
            child: Text("点击切换显示") ,
            onPressed: (){
              setState(() {
                offstage = !offstage;
              });
            },
          )
        ],
      ),
    );
  }
}