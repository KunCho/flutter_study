import 'package:flutter/material.dart';
import 'package:flutter_study/demo12.dart';
import 'package:flutter_study/log_utils.dart';
import 'package:wrapper/wrapper.dart';

class TextList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('练习'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            CustomButton('/Text1', 'Text1', Colors.orange),
            CustomButton('/Text2', 'Text2', Colors.deepOrange),
            CustomButton('/Text3', 'Text3', Colors.blueGrey),
            CustomButton('/Text4', 'Text4', Colors.teal),
            CustomButton('/Text5', 'Text5', Colors.indigo),
//            CustomButton('/Text6','Text6',Colors.brown),
            RaisedButton(
                onPressed: () {
//              _navigateNewRoute(wi)
                  print('HHHHHHHH');
                  _navigateNewRoute(context);
                },
                child: new Text(
                  'Text6',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown),
            CustomButton('/Demo22', 'Text7', Colors.indigo),
            CustomButton('/Text8', 'Text8加载网络列表数据', Colors.cyan),
            Wrapper(
              color: Color(0xff95EC69),
              spineType: SpineType.left,
              child: Text('灵犀'*5),
            ),
            Wrapper(
              color: Color(0xffFFFFFF),
              spineType: SpineType.right,
              child: Text('你好'*6),
            )
          ],
        ),
      ),
    );
  }

  void _navigateNewRoute(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/Text6',
        arguments: {'name': '传递对象', 'value': '8888'});
    print('收到的回传的数据:$result');
    LogUtils.e('tag', result);
  }
}
