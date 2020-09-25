import 'package:flutter/material.dart';

import 'demo8.dart';

class TapCParentWidget extends StatefulWidget{
  @override
  _TapCParentWidgetState createState() => new _TapCParentWidgetState();

}

class _TapCParentWidgetState extends State<TapCParentWidget>{
  @override
  Widget build(BuildContext context) {
    bool _active =false;
    void _handleTapBoxChanged(bool newValue){
      setState(() {
        _active = newValue;
      });
    }
    return new Container(
      child: TapBoxC(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }

}