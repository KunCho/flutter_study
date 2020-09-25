import 'package:flutter/material.dart';

import 'demo6.dart';

class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() => _ParentWidgetState();

}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapBoxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }

}