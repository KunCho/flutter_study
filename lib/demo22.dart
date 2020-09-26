import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

class IsolationDemoPage extends StatefulWidget {
  @override
  _IsolationDemoPageState createState() => new _IsolationDemoPageState();

  IsolationDemoPage({Key key}) : super(key: key);
}

class _IsolationDemoPageState extends State<IsolationDemoPage> {
  List widgets = [];

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
  getProgressDialog() {
    return Center(child: new CircularProgressIndicator());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: getBody());
  }
  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });
  Widget getRow(int i) {
    return Padding(padding: EdgeInsets.all(10.0), child: Text("Row ${widgets[i]["title"]}"));
  }
  loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    // The 'echo' isolate sends it's SendPort as the first message
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");
    setState(() {
      widgets = msg;
    });
  }
// the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = ReceivePort();
    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(json.decode(response.body));
    }
  }
  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

}
