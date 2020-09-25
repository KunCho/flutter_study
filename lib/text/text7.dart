import 'package:common_utils/common_utils.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Text7 extends StatelessWidget {
  final value;

  Text7({Key key, @required this.value}) : super(key: key);
  String _errorText;

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    final wordPair = new WordPair.random();


    return Scaffold(
      appBar: AppBar(
        title: Text("页面传值"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(
                context, {'name': '点击返回了', 'value': '回传值'});
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("从构造函数传递过来的值是:$value,\n这个是新页面,传递的参数是：$args \n随机数:$wordPair"),
            RaisedButton(
              onPressed: () {
                Navigator.pop(
                    context, {'name': '上级页面返回7777777777的数据', 'value': 8888});
              },
              child: Text(
                '返回',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
