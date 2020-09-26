import 'package:flutter/material.dart';
import 'package:flutter_study/commponent/material_tap_widget.dart';
import 'package:flutter_study/commponent/message_dialog.dart';

import '../utils.dart';

class UserFakeWeChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.black),
              tooltip: "Alarm",
              onPressed: () {
                print("Alarm");
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 50.0, top: 10),
              height: 135.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: 75.0,
                        height: 75.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      widthFactor: 1.0, //Align的宽度将会是child的x倍
                      heightFactor: 1.0,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text('姓名'),
                              Container(
//                            color: Colors.teal,
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('账号：xkkd'),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: <Widget>[
//                                          Icon(Icons.dialer_sip),
                                        Image(
                                          image: AssetImage(
                                              'assets/image/qrcode.png'),
                                          width: 30,
                                          height: 30,
                                          color: Color(0xffbbbbbb),
                                        ),
//                                    Icon(Icons.keyboard_arrow_right),
                                        GestureDetector(
                                          child: Icon(
                                              Icons.keyboard_arrow_right),
                                          onTap: () {
                                            print('点击了ICON');
                                            Utils.showToast("跳转");
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.payment,
                        color: Color(0xff88d855),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('支付'),
                      )
                    ],
                  ),
                  MaterialTapWidget(
                    child: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => MessageDialog(
                            title: '提示',
                            message: '跳转支付',
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
              height: 10,
              color: Color(0xffeeeeee),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              color: Color(0xffeeeeee),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.payment,
                        color: Color(0xff88d855),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('收藏'),
                      )
                    ],
                  ),
                  MaterialTapWidget(
                    child: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffeeeeee),
              margin: EdgeInsets.only(left: 45),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              color: Color(0xffeeeeee),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.payment,
                        color: Color(0xff88d855),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('相册'),
                      )
                    ],
                  ),
                  MaterialTapWidget(
                    child: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffeeeeee),
              margin: EdgeInsets.only(left: 45),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.payment,
                        color: Color(0xff88d855),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('卡包'),
                      )
                    ],
                  ),
                  MaterialTapWidget(
                    child: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffeeeeee),
              margin: EdgeInsets.only(left: 45),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              color: Color(0xffeeeeee),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.exit_to_app,
                        color: Color(0xff88d855),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('表情'),
                      )
                    ],
                  ),
                  MaterialTapWidget(
                    child: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              height: 10,
              color: Color(0xffeeeeee),
            ),
          ],
        ));
  }
}
