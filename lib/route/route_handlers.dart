
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/basic_component/basic_layout_component.dart';
import 'package:flutter_study/home/home.dart';
import 'package:flutter_study/user/user_center.dart';
import 'package:flutter_study/user/user_fake_wechat.dart';
import 'package:flutter_study/user/user_info.dart';

import '../demo1.dart';
import '../demo10.dart';
import '../demo11.dart';
import '../demo13.dart';
import '../demo14.dart';
import '../demo15.dart';
import '../demo16.dart';
import '../demo17.dart';
import '../demo18.dart';
import '../demo19.dart';
import '../demo20.dart';
import '../demo2.dart';
import '../demo23.dart';
import '../demo3.dart';
import '../demo_communication.dart';
import '../demo_painter.dart';
import '../index.dart';
import '../login_demo.dart';

//根目录
var rootHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,dynamic>params)=>DemoPage()
);

var loginHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>LoginDemo()
);

var  basicLayoutComponentHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>BasicLayoutComponent()
);

var  demo1Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo1()
);

var  demo2Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo2()
);
var  demo3Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo3()
);
var  demo4Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo4Signature()
);

var  demo10Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo10()
);
var  demo11Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo11()
);
var  demo13Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo13()
);

var  demo15Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo15()
);
var  demo16Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo16()
);
var  demo17Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo17()
);
var  demo18Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo18(items: new List<String>.generate(20, (i) => 'Item ${i + 1}'))
);
var  demo19Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo19()
);
var  demo20Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo20()
);
var  demo23Handler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Demo23Page()
);
var  userCenterHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>UserCenter()
);
var  userInfoHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>UserInfo()
);
var  homeHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Home()
);
var  communicationHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>Communication()
);
var  userFakeWeChatHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>UserFakeWeChat()
);
var  sampleAppPageHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) =>SampleApp()
);