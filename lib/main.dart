import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

import 'NewRoute.dart';
import 'basic_layout/container/container_intro.dart';
import 'demo1.dart';
import 'demo10.dart';
import 'demo11.dart';
import 'demo13.dart';
import 'demo14.dart';
import 'demo15.dart';
import 'demo16.dart';
import 'demo17.dart';
import 'demo18.dart';
import 'demo19.dart';
import 'demo2.dart';
import 'demo20.dart';
import 'demo22.dart';
import 'demo23.dart';
import 'demo3.dart';
import 'demo_communication.dart';
import 'demo_painter.dart';
import 'home/home.dart';
import 'index.dart';
import 'login_demo.dart';
import 'not_found_page.dart';
import 'text/text1.dart';
import 'text/text2.dart';
import 'text/text3.dart';
import 'text/text4.dart';
import 'text/text5.dart';
import 'text/text6.dart';
import 'text/text_list.dart';
import 'user/user_about.dart';
import 'user/user_center.dart';
import 'user/user_fake_wechat.dart';
import 'user/user_info.dart';
import 'user/user_modify_password.dart';
import 'user/user_setting.dart';

const int ThemeColor = 0xFFC91B3A;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: new DemoList(),
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),

      home: MyHomePage(
        title: '首页',
      ),

      //注册路由表
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/ContainerIntro":(BuildContext context) => ContainerIntro(),
        "new_page": (context) => NewRoute(
              value: '嘻嘻哈哈',
            ),
        "/Demo1": (BuildContext context) => Demo1(),
        "/Demo2": (BuildContext context) => Demo2(),
        "/Demo3": (BuildContext context) => Demo3(),
        "/Demo4": (BuildContext context) => Demo4Signature(),
        "/Demo10Scaffold": (BuildContext context) => Demo10Scaffold(),
        "/Demo11": (BuildContext context) => Demo11(),
        "/Demo13": (BuildContext context) => Demo13(),
        "/Demo15": (BuildContext context) => Demo15(),
        "/Demo16": (BuildContext context) => Demo16(),
        "/Demo17": (BuildContext context) => Demo17(),
        "/MyHomePage": (BuildContext context) => MyHomePage(
              title: '随机列表',
            ),
        "/Demo18": (BuildContext context) => Demo18(
            items: new List<String>.generate(20, (i) => 'Item ${i + 1}')),
        "/LoginDemo": (BuildContext context) => LoginDemo(),
        "/Demo19": (BuildContext context) => Demo19(),
        "/Demo20": (BuildContext context) => Demo20(),
        "/UserCenter": (BuildContext context) => UserCenter(),
        "/UserInfo": (BuildContext context) => UserInfo(),
        "/UserSetting": (BuildContext context) => UserSetting(),
        "/UserModifyPassword": (BuildContext context) => UserModifyPassword(),
        "/UserAbout": (BuildContext context) => UserAbout(),
        "/Home": (BuildContext context) => Home(),
        "/Communication": (BuildContext context) => Communication(),
        "/UserFakeWeChat": (BuildContext context) => UserFakeWeChat(),
        "/Demo23": (BuildContext context) => Demo23Page(),
        "/Text": (BuildContext context) => TextList(),
        '/Text1': (BuildContext context) => Text1(),
        '/Text2': (BuildContext context) => Text2Page(context),
        '/Text3': (BuildContext context) => Text3Page(context),
        '/Text4': (BuildContext context) => Text4(),
        '/Text5': (BuildContext context) => Text5(),
        '/Text6': (BuildContext context) => Text6(),
        '/Demo22': (BuildContext context) => IsolationDemoPage(),
        '/Text8': (BuildContext context) => SampleAppPage(),
      },
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
  Timer timer;
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(ThemeColor),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSharedText();
    timer = new Timer(const Duration(milliseconds: 500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => DemoList()),
            ( //跳转到主页
                    Route route) =>
                route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    timer.cancel();
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
