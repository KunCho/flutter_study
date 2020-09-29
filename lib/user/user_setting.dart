import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/commponent/material_tap_widget.dart';
import 'package:flutter_study/commponent/message_dialog.dart';

import '../utils.dart';

class UserSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserSettingPage(context);
  }
}

class UserSettingPage extends StatefulWidget {
  final BuildContext pageContext;

  UserSettingPage(this.pageContext);

  @override
  UserSettingState createState() => UserSettingState(pageContext);
}

class UserSettingState extends State<UserSettingPage> {
  bool valueSwitch = true;
  BuildContext pageContext;

  UserSettingState(this.pageContext);

  @override
  Widget build(BuildContext context) {
    context = pageContext;
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
          title: Text(
            '设置',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(pageContext).pop();
              })),
      body: Container(
        color: Color(0xffffffff),
//        constraints: c,
        height: 230,

//        alignment: AlignmentGeometry.lerp(a, b, t),
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          children: <Widget>[
            Container(
              height: 10,
              color: Color(0xffeeeeee),
            ),
            MaterialTapWidget(
              onTap: () {
                Navigator.pushNamed(context, '/UserModifyPassword');

                /*Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserModifyPassword();
                }));*/
              },
//              color: Color(0xffeeeeee),
              child: Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: <Widget>[
                    Text('密码设置'),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            Container(
              height: 10,
              color: Color(0xffeeeeee),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              color: Color(0xffeeeeee),
              child: Row(
                children: <Widget>[
                  Text('清除存储空间'),
//                  Icon(Icons.keyboard_arrow_right),
                  MaterialTapWidget(
                    child: Row(
                      children: <Widget>[
                        Text('1000.09Mb'),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                    onTap: () {
                      /*showDialog(
                          context: context,
                          builder: (context) => LoadingDialog(
                            text: '清除缓存中……',
                          ));*/
                      /*showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('提示'),
                            content: Text(('清除缓存')),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("取消"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              new FlatButton(
                                child: new Text("确定"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ));*/
                      showDialog(
                          context: context,
                          builder: (context) => MessageDialog(
                                title: '提示',
                                message: '清除缓存',
                                negativeText: '取消',
                                positiveText: '确定',
                                onCloseEvent: () {
                                  Navigator.of(context).pop();
                                },
                                onPositivePressEvent: () {
                                  Navigator.of(context).pop();
                                },
                              ));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffeeeeee),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              color: Color(0xffeeeeee),
              child: Row(
                children: <Widget>[
                  Text('开启指纹登录'),
//                  Icon(Icons.keyboard_arrow_right),
                  CupertinoSwitch(
                      value: this.valueSwitch,
                      onChanged: (bool value) {
                        setState(() {
                          this.valueSwitch = value;
                        });
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              height: 10,
              color: Color(0xffeeeeee),
            ),
            MaterialTapWidget(
              onTap: () {
                Utils.showToast('点击了密码设置。');
              },
//              color: Color(0xffeeeeee),
              child: Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '密码设置',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
//                color: Color(0xff00ff00),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffeeeeee)),
                    color: Colors.white),
              ),
            ),
//            Divider(),
          ],
        ),
      ),
    );
  }
}
