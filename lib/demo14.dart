import 'package:flutter/material.dart';

import 'model/play_data.dart';
import 'net_request/net_utils.dart';



class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];
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

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Text8"),
        ),
        body: getBody());
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: Text(widgets[i].chapterName)
    );
  }

  loadData() async {
    pageNo = 0;
    widgets.clear();
//    String dataUrl ='https://jsonplaceholder.typicode.com/posts';
    String dataUrl = 'https://www.wanandroid.com/article/list/${pageNo}/json';
    print(dataUrl);
    try {
      var data = await NetUtils.get('/article/list/${pageNo}/json');

      print('=================');
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