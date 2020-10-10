import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'route/router.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        title: Text('Demo 列表'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _navigateNewRoute(context);
//                Routes
              },
              child: Text(
                'new_page',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
            ),
            RaisedButton(
              onPressed: () {
                FluroRouters.navigateTo(context, FluroRouters.basicLayout,params: {
                  'pageTitle':'基础布局控件🧘🏻‍♀️',
                  'id':'1988',
                  'gender':'female'
                });
//                Routes
              },
              child: Text(
                'Demo1 基础布局组件介绍',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.brown,
            ),
            CustomButton(
                FluroRouters.demo1, 'Demo1 带有banner页面 动态改版', Colors.orange),
            CustomButton(FluroRouters.demo2, 'Demo2 简单布局页面', Colors.teal),
            CustomButton(FluroRouters.demo3, 'Demo3 修改组件', Colors.purple),
            CustomButton(FluroRouters.demo4, 'Demo4 使用Canvas draw/paint',
                Colors.deepOrange),
            CustomButton(FluroRouters.demo11, 'Demo11 Fade渐显动画', Colors.green),
            CustomButton(
                FluroRouters.demo15, 'Demo15 loading加载网络GIF', Colors.blue),
            CustomButton(FluroRouters.demo13, 'Demo13 下拉刷新 上拉加载', Colors.amber),
            CustomButton(FluroRouters.demo16, 'Demo16 发送消息', Colors.cyan),
            CustomButton(FluroRouters.demo17, 'Demo17 flat button', Colors.cyan),
            CustomButton(FluroRouters.demo18, 'Demo18 列表右滑删除', Colors.green),
            CustomButton(FluroRouters.login, '仿登录页面', Colors.lime),
            CustomButton(
                FluroRouters.demo19, 'Demo19带有bottomNavigationBar', Colors.pink),
            CustomButton(FluroRouters.userCenter, '个人中心', Colors.amber),
            CustomButton(FluroRouters.userInfo, '个人中心', Colors.pink),
            CustomButton(FluroRouters.home, '主页', Colors.amber),
            CustomButton(FluroRouters.communication, '通信', Colors.teal),
            CustomButton(
                FluroRouters.userFakeWeChat, '仿个人信息页面', Colors.deepPurple),
            CustomButton('/IsolationDemo', '隔离Demo', Colors.green),
            CustomButton(FluroRouters.demo23, 'Demo23', Colors.blue),
            CustomButton(
                FluroRouters.sampleAppPage, 'SampleAppPage', Colors.lime),
            CustomButton(FluroRouters.demo10, 'Demo10', Colors.pink),
          ],
        ),
      ),
    );
  }

  void _navigateNewRoute(BuildContext context) async {
    final result = await Navigator.pushNamed(context, 'new_page',
        arguments: {'name': '传递对象', 'value': '8888'});
    print('收到的回传的数据:$result');
  }
}
