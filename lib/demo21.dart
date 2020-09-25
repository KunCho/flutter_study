import 'package:flutter/material.dart';
import 'dart:convert';

import 'model/user.dart';

///
///共享元素动画
///
class Demo21 extends StatelessWidget {
  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      indicators.add(Container(
          width: 6.0,
          height: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == 1 ? Colors.white : Colors.grey)));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: indicators);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.cyan],
                    begin: Alignment.centerRight,
//                    end: Alignment(0.8, 0.0),
                  end: Alignment.centerLeft,
                    tileMode: TileMode.mirror,
                  ),
                image: DecorationImage(
                  image: NetworkImage('http://jlouage.com/images/author.jpg'),
                  fit: BoxFit.contain
                )
              ),
              child: Hero(
                tag: 'hero',
                child: new FlutterLogo(
                  size: 200,
                ),
              ),
            ),
          ),
          RaisedButton(onPressed: (){
            parseJson('');
          },
            child: Text('json'),
            color: Colors.cyan,
          ),
          _buildIndicator()
        ],
      ),
    );
  }

  void parseJson(String jsonStr){
    Map userMap = json.decode('{ "email": "123@qq.com","name":"kk" }');
    var user = new User.fromJson(userMap);
    print('user===========');
    print(user.name);
    print(user.email);
    String userStr = json.encode(user);
    print(userStr);
  }
}
