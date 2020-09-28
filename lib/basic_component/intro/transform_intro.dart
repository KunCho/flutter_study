import 'package:flutter/material.dart';

class TransformIntro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform的简单使用'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Transform(
          transform: Matrix4.rotationZ(0.3),
          child: Container(
            color: Colors.blue,
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}

