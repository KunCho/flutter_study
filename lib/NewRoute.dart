import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewRoute extends StatelessWidget {
  final value;

  NewRoute({Key key, @required this.value}) : super(key: key);
  String _errorText;

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    final wordPair = new WordPair.random();
    LogUtil.e('参数===');
    LogUtil.e(args);

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
            Text("从构造函数传递过来的值是$value,这个是新页面,传递的参数是：$args 随机数$wordPair"),
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
            TextField(
              decoration: InputDecoration(hintText: 'This is a hint text...'),
            ),
            TextField(
                onSubmitted: (String text) {
                  if (!isEmail(text)) {
                    _errorText = 'Error: This is not an email';
                  } else {
                    _errorText = null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'this is a hint text...',
                    errorText: _getErrorText())),
            RaisedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text('Increment Counter'),
            )
          ],
        ),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }
}
