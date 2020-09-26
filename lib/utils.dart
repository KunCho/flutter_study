import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_study/commponent/common_webview.dart';
import 'package:flutter_study/log_utils.dart';

class Utils {
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static route2Web(BuildContext context, String title, String url) {
    if (null == url) {
      return;
    }
    LogUtils.e('url======', url);
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          print('$url');
          return CommonWebView(title, url);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(opacity: animation,
            child: FadeTransition(
              opacity:
              Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),);
        }));
  }
}
