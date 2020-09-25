import 'package:flutter/material.dart';

class Text4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: FadeTest(title: 'Fade demo'),
    );
  }
}

class FadeTest extends StatefulWidget {
  @override
  FadeState createState() {
    return FadeState();
  }

  FadeTest({Key key, this.title}) : super(key: key);
  final String title;
}

class FadeState extends State<FadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        tooltip: 'Fade',
        child: Icon(Icons.brush),
      ),
    );
  }
}