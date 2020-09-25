import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget{
  final String label;
  final String title;
  final MaterialColor color;
  CustomButton(this.label,this.title,this.color);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: (){
      print('打印：===='+label);
      LogUtil.e(label);
//      LogUtil.v(label);
      Navigator.pushNamed(context, label);

    },child: Text(title,style: TextStyle(color: Colors.white),),color: color,);
  }

}