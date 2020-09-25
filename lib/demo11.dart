import 'package:flutter/material.dart';

class Demo11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade demo',
      theme: new ThemeData(primarySwatch: Colors.green),
      home: new FadeTest(title: 'Fade demo'),
    );
  }
}

class FadeTest extends StatefulWidget {
  @override
  FadeState createState() {
    return new FadeState();
  }

  FadeTest({Key key, this.title}) : super(key: key);
  final String title;
}

class FadeState extends State<FadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: curve,
            child: new FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
      ),
    );
  }
}
