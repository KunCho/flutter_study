import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_study/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/play_data.dart';
import 'net_request/net_utils.dart';

class Demo13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Demo13',
      theme: new ThemeData(primarySwatch: Colors.green),
      home: new Demo13Page(),
    );
  }
}

class Demo13Page extends StatefulWidget {
  Demo13Page({Key key}) : super(key: key);

  @override
  _Demo13PageState createState() {
    return new _Demo13PageState();
  }
}

class _Demo13PageState extends State<Demo13Page> {
  List widgets = [];
  EasyRefreshController _controller;
  int _count = 20;
  int pageNo = 0;

  // 控制结束
  bool _enableControlFinish = false;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('测试请求网络数据'),
        centerTitle: true,
      ),
//      body: getBody(),
      body: EasyRefresh.custom(
        firstRefresh: true,
        firstRefreshWidget: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: SizedBox(
            height: 200.0,
            width: 300.0,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingCube(
                      color: Theme.of(context).primaryColor,
                      size: 25.0,
                    ),
                  ),
                  Container(
                    child: Text('加载中……'),
                  )
                ],
              ),
            ),
          )),
        ),
        enableControlFinishRefresh: true,
        enableControlFinishLoad: false,
        controller: _controller,
        header: BallPulseHeader(color: Colors.green),
        footer: BallPulseFooter(color: Colors.green),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onRefresh');
            loadData();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            loadMoreData();
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
//                    launch(widgets[index].link);
//                    Utils.route2Web(context, widgets[index].chapterName, widgets[index].link);
                    Utils.route2Web(context, widgets[index].chapterName, widgets[index].link);

                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child:Row(
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text(widgets[index].chapterName),
                          Padding(padding: EdgeInsets.fromLTRB(0,4,0,4)),
                          Text('发布时间：'+widgets[index].niceDate,style: TextStyle(fontSize: 10),)
                        ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    color:
                        index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                  ),
                );
              },
              childCount: widgets.length,
            ),
          ),
        ],
      ),
      /*persistentFooterButtons: <Widget>[
        FlatButton(
            onPressed: () {
              _controller.callRefresh();
            },
            child: Text("Refresh", style: TextStyle(color: Colors.black))),
        FlatButton(
            onPressed: () {
              _controller.callLoad();
            },
            child: Text("Load more", style: TextStyle(color: Colors.black))),
      ],*/
    );
  }

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(widgets[i].chapterName));
  }

  void loadData() async {
    pageNo = 0;
    widgets.clear();
//    String dataUrl ='https://jsonplaceholder.typicode.com/posts';
    String dataUrl = 'https://www.wanandroid.com/article/list/${pageNo}/json';
    print(dataUrl);
    try {
      Response response = await Dio().get(dataUrl);
      var data = response.data;

      print('=================');
      print(data);

//      Map dataMap = json.decode('{ "email": "123@qq.com","name":"kk" }');
      var playData = new PlayData.fromJson(data);

      setState(() {
        widgets = playData.data.datas;
      });
      if (!_enableControlFinish) {
        _controller.resetLoadState();
        _controller.finishRefresh();
      }
    } catch (e) {
      print(e);
    }
  }

  var future = NetUtils.get('/article/list/1/json');
  Response response1;
  setData()async{
    response1 = await future;
    print('=======hhhhhhhhhhhh==========');
    print(response1.data);
  }

  void loadMoreData() async {
    String dataUrl = 'https://www.wanandroid.com/article/list/${++pageNo}/json';
    print(dataUrl);

    try {
      var data = await NetUtils.get('/article/list/${++pageNo}/json');
//      Future future = NetUtils.get('/article/list/${++pageNo}/json')

//      Response response = await Dio().get(dataUrl);
//      var data = response.data;

      print('=================');
      print(data);

      var playData = new PlayData.fromJson(data);
      List datas = playData.data.datas;

      widgets.addAll(datas);
      List newData = widgets;
      print(newData.length);
      setState(() {
        widgets = newData;
      });
      if (!_enableControlFinish) {
        _controller.finishLoad(noMore: pageNo >= playData.data.pageCount);
      }
    } catch (e) {
      print(e);
    }
  }

  getProgressDialog() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  ListView getListView() => new ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
        itemCount: widgets.length,
      );

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }
}
