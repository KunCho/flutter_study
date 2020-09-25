import 'package:flutter/material.dart';

class LoadingDialog extends Dialog{
  final String text;

  LoadingDialog({Key key,@required this.text}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              color: Color(0xffffffff)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(backgroundColor: Colors.red,),
                Padding(padding: EdgeInsets.only(top: 20.0),
                  child: Text(text,style: TextStyle(fontSize: 12.0),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}