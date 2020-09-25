import 'package:flutter/material.dart';

class Demo17 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final title = 'Inkwel Demo';
    return new MaterialApp(
      title:title,
      home: new Demo17Page(title: title,),
    );
  }

}

class Demo17Page extends StatelessWidget{
  final String title;

  Demo17Page({Key key,this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }

}

class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap')));
      },
      child: RaisedButton(
        padding: const EdgeInsets.all(12),
        child: Text('FLat Button'),
      ),
    );
  }
}