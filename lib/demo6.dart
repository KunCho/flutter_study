
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TapBoxB extends StatelessWidget{

  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxB({Key key,this.active:false, @required this.onChanged}):super(key:key);

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(active?'Active':'Inactive',style: new TextStyle(fontSize: 32,color: Colors.white),),
        ),
        width: 200,
          height: 200,
        decoration: new BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }

}