import 'package:flutter/material.dart';

import 'route/router.dart';
class CustomButton extends StatelessWidget{
  final String label;
  final String title;
  final MaterialColor color;
  CustomButton(this.label,this.title,this.color);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){
      print('打印：===='+label);
//      Navigator.pushNamed(context, label);
      FluroRouters.navigateTo(context, label);

    },child: Text(title,style: TextStyle(color: Colors.white),),color: color,);
  }

}