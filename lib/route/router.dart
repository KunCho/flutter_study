import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../basic_component/basic_layout_component.dart';
import '../index.dart';
import '../login_demo.dart';
import '../not_found_page.dart';
import 'route_handlers.dart';

class FluroRouter {
  static Router router;

  static String root = '/';
  static String login = '/LoginDemo';
  static String basicLayout = '/BasicLayoutComponent';
  static String demo1 = '/Demo1';
  static String demo2 = '/Demo2';
  static String demo3 = '/Demo3';
  static String demo4 = '/Demo4';
  static String demo10 = '/Demo10';
  static String demo11 = '/Demo11';
  static String demo13 = '/Demo13';
  static String demo15 = '/Demo15';
  static String demo16 = '/Demo16';
  static String demo17 = '/Demo17';
  static String demo18 = '/Demo18';
  static String demo19 = '/Demo19';
  static String demo20 = '/Demo20';
  static String demo23 = '/Demo23';
  static String userCenter = '/userCenter';
  static String userInfo = '/userInfo';
  static String home = '/Home';
  static String communication = '/Communication';
  static String userFakeWeChat = '/UserFakeWeChat';
  static String sampleAppPage = '/SampleAppPage';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('route not found!');
//      NotFoundPage();
      return NotFoundPage();
    });

    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(basicLayout, handler: basicLayoutComponentHandler);
    router.define(demo1, handler: demo1Handler);
    router.define(demo2, handler: demo2Handler);
    router.define(demo3, handler: demo3Handler);
    router.define(demo4, handler: demo4Handler);
    router.define(demo10, handler: demo10Handler);
    router.define(demo11, handler: demo11Handler);
    router.define(demo13, handler: demo13Handler);
    router.define(demo15, handler: demo15Handler);
    router.define(demo16, handler: demo16Handler);
    router.define(demo17, handler: demo17Handler);
    router.define(demo18, handler: demo18Handler);
    router.define(demo19, handler: demo19Handler);
    router.define(demo20, handler: demo20Handler);
    router.define(demo23, handler: demo23Handler);
    router.define(userCenter, handler: userCenterHandler);
    router.define(userInfo, handler: userInfoHandler);
    router.define(home, handler: homeHandler);
    router.define(communication, handler: communicationHandler);
    router.define(userFakeWeChat, handler: userFakeWeChatHandler);
    router.define(sampleAppPage, handler: sampleAppPageHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return router.navigateTo(context, path, transition:transition);
  }

}
