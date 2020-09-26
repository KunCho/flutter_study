import 'package:flutter/material.dart';

import 'demo12.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DemoList(),
    );
  }
}

class DemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: Text('Demo 列表'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _navigateNewRoute(context);
              },
              child: Text(
                'new_page',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
            ),
            Divider(),
            CustomButton('/BasicLayoutComponent', 'Demo1 基础布局页面', Colors.brown),
            Divider(),
            CustomButton('/Demo1', 'Demo1 带有banner页面 动态改版', Colors.orange),
            Divider(),
            CustomButton('/Demo2', 'Demo2 简单布局页面', Colors.teal),
            Divider(),
            CustomButton('/Demo3', 'Demo3 修改组件', Colors.purple),
            Divider(),
            CustomButton(
                '/Demo4', 'Demo4 使用Canvas draw/paint', Colors.deepOrange),
            Divider(),
            CustomButton('/Demo11', 'Demo11 Fade渐显动画', Colors.green),
            Divider(),
            CustomButton('/Demo15', 'Demo15 loading加载网络GIF', Colors.blue),
            Divider(),
            CustomButton('/Demo13', 'Demo13 下拉刷新 上拉加载', Colors.amber),
            Divider(),
            CustomButton('/Demo16', 'Demo16 发送消息', Colors.cyan),
            Divider(),
            CustomButton('/Demo17', 'Demo17 flat button', Colors.cyan),
            Divider(),
            CustomButton('/Demo18', 'Demo18 列表右滑删除', Colors.green),
            Divider(),
            CustomButton('/LoginDemo', '仿登录页面', Colors.lime),
            Divider(),
            CustomButton('/Demo19', 'Demo19带有bottomNavigationBar', Colors.pink),
            Divider(),
            Hero(
                tag: 'hero',
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Demo20');
                  },
                  color: Colors.lightGreen,
                  icon: new Icon(Icons.threed_rotation),
                )),
            Divider(),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/UserCenter');
              },
              child: Text('个人中心'),
            ),
            CustomButton('/UserInfo', '个人中心', Colors.pink),
            Divider(),
            CustomButton('/Home', '主页', Colors.amber),
            Divider(),
            CustomButton('/Communication', '通信', Colors.teal),
            Divider(),
            CustomButton('/UserFakeWeChat', '仿个人信息页面', Colors.deepPurple),
            Divider(),
            CustomButton('/IsolationDemo', '隔离Demo', Colors.green),
            Divider(),
            CustomButton('/Demo23', 'Demo23', Colors.blue),
            Divider(),
            CustomButton('/Text', '练习', Colors.amber),
          ],
        ),
      ),
    );
  }

  void _navigateNewRoute(BuildContext context) async {
    final result =
        await Navigator.pushNamed(context, 'new_page', arguments: {'name': '传递对象', 'value': '8888'});
    print('收到的回传的数据:$result');
  }
}
