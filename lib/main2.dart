import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_study/NewRoute.dart';
import 'package:flutter_study/RandomWordsWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'demo1.dart';
import 'demo10.dart';
import 'demo11.dart';
import 'demo13.dart';
import 'demo15.dart';
import 'demo16.dart';
import 'demo17.dart';
import 'demo18.dart';
import 'demo19.dart';
import 'demo2.dart';
import 'demo3.dart';
import 'index.dart';
import 'login_demo.dart';

const int ThemeColor = 0xFFC91B3A;
/*void main() {
//  debugPaintSizeEnabled = !true;
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
//      home: new DemoList(),
      home: new MyHomePage(title: '首页',),
      //注册路由表
      routes: {
        "new_page": (context) => NewRoute(value: '嘻嘻哈哈',),
        "Demo1": (context) => Demo1(),
        "Demo2": (context) => Demo2(),
        "Demo3": (context) => Demo3(),
        "Demo10Scaffold": (context) => Demo10Scaffold(),
        "Demo11": (context) => Demo11(),
        "Demo13": (context) => Demo13(),
        "Demo15": (context) => Demo15(),
        "Demo16": (context) => Demo16(),
        "Demo17": (context) => Demo17(),
        "MyHomePage": (context) => MyHomePage(title: '随机列表',),
        "Demo18": (context) => Demo18(items: new List<String>.generate(20, (i)=>'Item ${i+1}')),
        "LoginDemo": (context) => LoginDemo(),
        "Demo19": (context) => Demo19(),
      },
    );
  }

}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.pushNamed(context, "new_page", arguments: "这个传递参数");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '这是一段文本:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            RandomWordsWidget(),
            Image.asset('assets/image/icon_compass.png'),
//          new Image(image: new AssetImage('assets/image/icon_compass.png'))
            new Image(image: new NetworkImage(
                'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg'))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();
  bool _isLoading = true;


  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: this._pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }


  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0), itemBuilder: (context, i) {
      if (i.isOdd) {
        return new Divider();
      }
      final index = i ~/ 2; //除以2向下取整
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take((10)));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.pushNamed(context, "Demo1", arguments: "这个传递参数");
  }

  showWelcomePage() {
    if (_isLoading) {
      return Container(
        color: const Color(ThemeColor),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    } else {
      return DemoList();
    }
  }

}
