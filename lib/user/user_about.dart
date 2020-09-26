import 'package:flutter/material.dart';
import 'package:flutter_study/commponent/loading_dialog.dart';
import 'package:flutter_study/commponent/material_tap_widget.dart';

class UserAbout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar:AppBar(
          title: Text(
            '关于',
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
                Navigator.of(context).pop();
              })),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/image/ic_about_logo.png'),
                    width: 80,
                    height: 80,
                  ),
                  Text('智店通V2.1.8')
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            color: Color(0xffffffff),
            child: Row(
              children: <Widget>[
                Text('检查新版本'),
//                  Icon(Icons.keyboard_arrow_right),
                MaterialTapWidget(
                  child: Row(
                    children: <Widget>[
                      Text('发现新版本'),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                  onTap: (){
                    /*showDialog(
                          context: context,
                          builder: (context) => LoadingDialog(
                            text: '清除缓存中……',
                          ));*/
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('提示'),
                          content: Text(('下载更新')),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("取消"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("确定"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                    context: context,
                                    builder: (context) => LoadingDialog(
                                      text: '下载中……',
                                    ));
                              },
                            ),
                          ],
                        ));

                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ],
      ),
    );
  }

}