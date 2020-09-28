import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Demo23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Demo23Page();
  }
}

class Demo23Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Demo23State();
  }
}

class _Demo23State extends State<Demo23Page> {
  List widgets = [{}, {}];
  EasyRefreshController _controller;
  int _count = 20;
  int pageNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo23'),
        centerTitle: true,
      ),
      body: EasyRefresh.custom(
          firstRefresh: false,
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
              ),
            ),
          ),
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          controller: _controller,
          header: BallPulseHeader(color: Colors.green),
          footer: BallPulseFooter(color: Colors.green),
          onRefresh: () async {},
          onLoad: () async {},
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('object');
//                    Utils.showToast('点击了列表');
                  },
                  child: Container(
                    width: 60.0,
                    height: 82.0,
//                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0)
                          ]),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              //具体条目
                              Image(
                                image: AssetImage(
                                    'assets/image/ic_inquiry_chat_blzx.png'),
                                width: 52,
                                height: 18,
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Text(
                                      '姓名',
                                    ),
                                  ),
                                  Text(
                                    '性别',
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 0, 0)),
                                  Text(
                                    '23岁',
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(0))
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
//                        Icon(Icons.keyboard_arrow_right)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
//                    color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                  ),
                );
              },
              childCount: widgets.length,
            ))
          ]),
    );
  }

  void loadData() async {

//    LogUtils.e('tag', "ddddddd");
//    LogUtil.init(true);
//  LogUtil.init
  }

  void loadMoreData() async {}
}
