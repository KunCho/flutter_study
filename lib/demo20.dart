import 'package:flutter/material.dart';

import 'demo21.dart';

///
///共享元素动画
///
class Demo20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
            tag: 'hero',
            child: Container(
              color: Colors.lightGreen,
              width: 50,
              height: 50,
              child: Icon(Icons.threed_rotation,color: Colors.pink,),
            )),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Demo21()));
        },
      ),
    );
  }
}
