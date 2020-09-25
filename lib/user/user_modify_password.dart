import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/commponent/material_tap_widget.dart';

import '../utils.dart';

class UserModifyPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserModifyPasswordPage(context),
    );
  }
}

class UserModifyPasswordPage extends StatefulWidget {
  final BuildContext pageContext;

  UserModifyPasswordPage(this.pageContext);

  @override
  _UserModifyPasswordState createState() {
    return new _UserModifyPasswordState(pageContext);
  }
}

class _UserModifyPasswordState extends State<UserModifyPasswordPage> {
  //手机号码控制器
  TextEditingController phoneController = TextEditingController();

  //密码控制器
  TextEditingController passwordController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  bool hidePassword = true;
  bool hideOldPassword = true;

  BuildContext pageContext;

  _UserModifyPasswordState(this.pageContext);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return new MaterialApp(
      title: '密码设置',
      home: Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: AppBar(
              title: Text(
                '密码设置',
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
          body: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    height: 10,
                    color: Color(0xffeeeeee),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      children: <Widget>[
                        Text('账号'),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text('137****0483'),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                  Container(
                    height: 10,
                    color: Color(0xffeeeeee),
                  ),
                  Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        width: size.width,
//                    height: size.height,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                            child: Text('旧密码'),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              obscureText: hideOldPassword, //设置密码隐藏
                              decoration: InputDecoration(
                                hintText: '请输入旧密码',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    color: hidePassword?Colors.grey:Colors.red,
                                    onPressed: () {
                                      setState(() {
                                        hideOldPassword = !hideOldPassword;
                                      });
                                    }),
                              ),

                            ),)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Color(0xffeeeeee),
                  ),
                  Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        width: size.width,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                            child: Text('新密码'),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: passwordController,
                              obscureText: hidePassword, //设置密码隐藏
                              decoration: InputDecoration(
                                hintText: '请输入新密码',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    color: hidePassword?Colors.grey:Colors.red,
                                    onPressed: () {
//                    passwordController.clear();
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    }),
                              ),

                            ),)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Color(0xffeeeeee),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      '密码必须包含字母、特殊字符、数字组合，长度要求6-20位',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: MaterialTapWidget(
                  onTap: (){
                    _modifyPassword();
                  },
//              color: Color(0xffeeeeee),
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      children: <Widget>[
                        Text('密码设置',style: TextStyle(color: Colors.red),),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
//                color: Color(0xff00ff00),
                    decoration:BoxDecoration(
                        border: Border.all(color: Color(0xffeeeeee)),
                        color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _modifyPassword() {
    if (phoneController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('请输入旧密码'),
            content: Text('请输入正确的手机号码'),
          ));
    } else if (passwordController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('请输入密码'),
            content: Text('请输入密码'),
          ));
    } else {
      phoneController.clear();
      passwordController.clear();
//      Navigator.push(context, CupertinoPageRoute<void>(builder: (ctx) => Demo19()));
      /*Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Demo19();
      }));*/
//      Utils.showToast('去请求接口。');
    }
  }
}
