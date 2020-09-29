import 'package:flutter/material.dart';

import 'model/play_data.dart';
import 'net_request/net_utils.dart';

class SampleApp extends StatefulWidget {
  SampleApp({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleApp> {
  List<Datas> widgets = [];
  int pageNo = 0;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text8"),
        ),
        body: getBody());
  }

  Widget getRow(int i) {
    print('===========start============');
    print(widgets[i].toJson());
    print('===========end============');
    return Container(
      height: 50.0,
        decoration: BoxDecoration(
//          border: Border.all(width: 2.0, color: Colors.red),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0)
            ]
        ),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: EdgeInsets.all(10.0), child: Text(widgets[i].chapterName));
  }

  loadData() async {
    pageNo = 0;
    widgets.clear();
//    String dataUrl ='https://jsonplaceholder.typicode.com/posts';
    String dataUrl = 'https://www.wanandroid.com/article/list/${pageNo}/json';
    print(dataUrl);
    try {
      var data = await NetUtils.get('/article/list/${pageNo}/json');
      print(data);
//      Map dataMap = json.decode('{ "email": "123@qq.com","name":"kk" }');
      var playData = new PlayData.fromJson(data);
      setState(() {
        widgets = playData.data.datas;
      });
    } catch (e) {
      print(e);
    }
  }
}
