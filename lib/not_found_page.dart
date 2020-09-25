import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '默认页面',
      home: Scaffold(
        body: Center(
          child: Text('未找到相应页面'),
        ),
      ),
    );
  }

}