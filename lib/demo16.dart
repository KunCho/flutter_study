import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Demo16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'Websocket demo';
    return Demo16Page(
      title: title,
      channel: new IOWebSocketChannel.connect('ws://echo.websocket.org'),
    );
  }
}

class Demo16Page extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  Demo16Page({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _Demo16PageState createState() {
    return _Demo16PageState();
  }
}

class _Demo16PageState extends State<Demo16Page> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: '发送信息:-)'),
            )),
            StreamBuilder(
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
              stream: widget.channel.stream,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            widget.channel.sink.add(_controller.text);
          }
        },
        tooltip: '发送信息',
        child: Icon(Icons.send),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
