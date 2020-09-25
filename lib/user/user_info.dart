import 'package:flutter/material.dart';
import 'package:flutter_study/utils.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '个人中心',
      home: Scaffold(
        appBar:AppBar(title: Text('我的',style:TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back,color: Colors.black,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_alert,color: Colors.red),
              tooltip: "Alarm",
              onPressed: () {
                print("Alarm");
              },
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          children: <Widget>[
            ListTile(
                title: Text(
                  '心有灵犀',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text('13718170483'),
                leading: Align(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://ws1.sinaimg.cn/large/610dc034ly1fid5poqfznj20u011imzm.jpg'),
                    radius: 28,
//                child: Image.network('https://ws1.sinaimg.cn/large/610dc034ly1fid5poqfznj20u011imzm.jpg'),
                    backgroundColor: Color(0xffff0000),
                    foregroundColor: Color(0x55000000),
                  ),
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.0, //Align的宽度将会是child的x倍
                  heightFactor: 1.0,
                ),
                trailing: new Icon(Icons.keyboard_arrow_right),
                contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0)),
//            Divider(
//              indent: 50.0,//分隔线左边缩进长度
//            ),

//            DecoratedBox(decoration: BoxDecoration(border: Border.all(color:Colors.grey[200],width: 1.0))),

            Container(
              height: 10,
              color: Color(0xffeeeeee),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                '设置',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
//                Utils.showToast('点击了设置。');
                Navigator.pushNamed(context, 'UserSetting');
              },
//              contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.snooze,
                color: Colors.blue,
              ),
              title: Text(
                '关于',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, 'UserAbout');
              },
            ),
            Divider(),
            //圆行图片
            Align(
              child: CircleAvatar(
//                child: Image.network(
//                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
                backgroundImage: NetworkImage(
                    "https://ws1.sinaimg.cn/large/610dc034ly1fid5poqfznj20u011imzm.jpg"),
                backgroundColor: Color(0xffff0000),
                radius: 50.0,
              ),
            ),
            Align(
              child: CircleAvatar(
//                child: Image.network(
//                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
                backgroundImage: NetworkImage(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
                foregroundColor: Color(0xffff0000),
                radius: 40.0,
              ),
            ),
            Align(
              child: ClipOval(
                child: SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Image.network(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
                child: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                  ),
                ),
              ),
            )),
            //圆角图片
            Align(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 80.0,
                height: 80.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
      /*routes: {
        "UserSetting": (context) => UserSetting(),
      },*/
    );
  }
}
