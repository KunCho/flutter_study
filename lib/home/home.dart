import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_study/commponent/material_tap_widget.dart';
import 'package:flutter_study/commponent/my_pagination.dart';
import 'package:flutter_study/model/banner_model.dart';
import 'package:flutter_study/model/home_model.dart';

import '../utils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(context),
      title: '主页',
    );
  }
}

class HomePage extends StatefulWidget {
  final BuildContext pageContext;

  HomePage(this.pageContext);

  @override
  _HomePageState createState() {
    return _HomePageState(pageContext);
  }
}

class _HomePageState extends State<HomePage> {
  BuildContext pageContext;
  EasyRefreshController _controller;


  _HomePageState(this.pageContext);


  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FutureBuilder(
            builder: (context, bannerData) {
              var bannerMap = json.decode(bannerData.data.toString());
              var bannerModel = new BannerModel.fromJson(bannerMap);
              var datas = bannerModel.data;
              return MyPagination(datas);
            },
            future: DefaultAssetBundle.of(context).loadString('assets/banner.json'),
          ),
          FutureBuilder(
            builder: (context, homeData) {
              var homeMap = json.decode(homeData.data.toString());
              var homeModel = new HomeModel.fromJson(homeMap);
              var commonAppList = homeModel.data.commonAppList;
              var commonApp = new CommonAppList(
                  1, '查看更多', '', 2, '', '', 1, 1, 1, 1, 1, 1, true);
              commonAppList.add(commonApp);
              return Flexible(
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  children: getWidgetList(commonAppList),
                  padding: EdgeInsets.all(10.0),
                  crossAxisSpacing: 15.0,
//                  mainAxisSpacing: 15.0,
                ),
//                flex: 2,
              );
            },
            future:
            DefaultAssetBundle.of(context).loadString('assets/home.json'),
          ),
          FutureBuilder(
            builder: (context, homeData) {
              var homeMap = json.decode(homeData.data.toString());
              var homeModel = new HomeModel.fromJson(homeMap);
              var commonAppList = homeModel.data.commonAppList;
              return Flexible(
                child: Container(
                  height: 90,
                  margin: EdgeInsets.only(top: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getHorizontalWidgetList(commonAppList),
                  ),
                ),
                flex: 2,
              );
            },
            future:
            DefaultAssetBundle.of(context).loadString('assets/home.json'),
          ),
        ],
      ),
    );
  }

  List<String> getDtaList() {
    List<String> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList(List<CommonAppList> commonAppList) {
    return commonAppList.map((item) => getItemContainer(item)).toList();
  }

  List<Widget> getHorizontalWidgetList(List<CommonAppList> commonAppList) {
    return commonAppList.map((item) => getHorizontalContainer(item)).toList();
  }

  Widget getItemContainer(CommonAppList item) {
    return MaterialTapWidget(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Image(
                image: item.icon == ''
                    ? AssetImage('assets/image/main_more.png')
                    : NetworkImage(item.icon),
                width: 35,
                height: 35,
                fit: BoxFit.cover),
            Text(
              item.name,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      onTap: () {
//        Utils.showToast('点击了${item.name}条目');
      },
    );
  }

  Widget getHorizontalContainer(CommonAppList item) {
    return MaterialTapWidget(
        child: Container(
          width: 160.0,
          margin: EdgeInsets.only(left: 5.0, right: 5.0),
//                        color: Colors.lightBlue,
          decoration: BoxDecoration(
            border: new Border.all(color: Color(0xffeeeeee), width: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
//            boxShadow: [BoxShadow(color: Color(0x99FFFF00), offset: Offset(5.0, 5.0),    blurRadius: 10.0, spreadRadius: 2.0), BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)), BoxShadow(color: Color(0xFF0000FF))],
          ),

          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '新增会员',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                Text(
                  '176',
                  style: TextStyle(fontSize: 25.0, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Utils.showToast('点击了磁贴');
        });
  }
}
