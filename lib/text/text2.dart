import 'package:flutter/material.dart';

class Text2Page extends StatefulWidget {
  final BuildContext context;
  Text2Page(this.context,{Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Text2PageState();
  }
}

class _Text2PageState extends State<Text2Page> {
  String textToShow = "I Like Flutter";

  void _updateText() {
    setState(() {
      textToShow = 'Flutter is Awesome!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('监听状态'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(widget.context).pop();
            }),
      ),
      body: Center(
        child: Text(textToShow),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update text',
        child: Icon(Icons.update),
      ),
    );
  }
}
