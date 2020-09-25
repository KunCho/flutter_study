import 'package:flutter/material.dart';

class Text3Page extends StatefulWidget {
  final BuildContext context;
  Text3Page(this.context,{Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Text3PageState();
  }
}

class _Text3PageState extends State<Text3Page> {
  String textToShow = "I Like Flutter";

  bool toggle = false;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return MaterialButton(onPressed: () {}, child: Icon(Icons.ac_unit));
    }
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
        child:_getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update text',
        child: Icon(Icons.update),
      ),
    );
  }
}
