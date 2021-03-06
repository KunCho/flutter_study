import 'dart:async';

import 'package:fluro/fluro.dart' as FluroRouter;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_study/route/router.dart';

import 'index.dart';
import 'not_found_page.dart';

const int ThemeColor = 0xFFC91B3A;

void main() {
  final router = FluroRouter.Router();
  FluroRouters.configureRoutes(router);
  FluroRouters.router =router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: new DemoList(),
      theme: ThemeData(
        primaryColor: const Color(0xffda4c3d),
      ),

//      home: MyHomePage(
//        title: '首页',
//      ),

      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      //注册路由表
      onGenerateRoute: FluroRouters.router.generator,//使用Fluro注册路由表
      /*routes: <String, WidgetBuilder>{
        "/BasicLayoutComponent":(BuildContext context) => BasicLayoutComponent(),
        "new_page": (context) => NewRoute(
              value: '嘻嘻哈哈',
            ),
        "/MyHomePage": (BuildContext context) => MyHomePage(
              title: '随机列表',
            ),
      },*/
      onUnknownRoute: (RouteSettings setting) {
        String name = setting.name;
        print('异常路由：onUnknownRoute:$name');
        return MaterialPageRoute(builder: (context) {
          return NotFoundPage();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  Timer timer;
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';

  @override
  Widget build(BuildContext context) {
    return DemoPage();
  }

  @override
  void initState() {
    super.initState();
    getSharedText();
    /*timer = new Timer(const Duration(milliseconds: 500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => DemoPage()),
            ( //跳转到主页
                    Route route) =>
                route == null);
      } catch (e) {}
    });*/
  }

  @override
  void dispose() {
//    timer.cancel();
    super.dispose();
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod('getSharedText');
    print('========');
    print(sharedData);

    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
