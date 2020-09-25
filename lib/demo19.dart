import 'package:flutter/material.dart';

import 'demo1.dart';
import 'demo18.dart';
import 'demo2.dart';
import 'demo3.dart';

class Demo19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'Bottom Navigation',
      home: Demo19Page(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class Demo19Page extends StatefulWidget {
  @override
  _Demo19PageState createState() {
    return new _Demo19PageState();
  }
}

class _Demo19PageState extends State<Demo19Page> {
  int _currentIndex = 0;
  final List<Widget> _children = [Demo1(), Demo2(), Demo3(), Demo18(items: new List<String>.generate(20, (i)=>'Item ${i+1}'))];
  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
    BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('图书')),
    BottomNavigationBarItem(icon: Icon(Icons.music_video), title: Text('音乐')),
    BottomNavigationBarItem(icon: Icon(Icons.headset_mic), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: PreferredSize(
////        title: Text('Bottom Navigation'),
//        child: Offstage(
//          offstage: _currentIndex == 3?true:false,
//          child: AppBar(
//            centerTitle: true,
//            backgroundColor: _currentIndex !=3?Theme.of(context).accentColor:Colors.transparent,
//          ),
//        ),
//        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *0.07),
//      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _list,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
    );
  }

  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
