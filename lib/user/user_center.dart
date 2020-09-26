import 'package:flutter/material.dart';

class UserCenter extends StatefulWidget {
  @override
  _UserCenterState createState() {
    return _UserCenterState();
  }
}

class _UserCenterState extends State<UserCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      drawer: _drawer(context),
      endDrawer: Drawer(
        child: Text('右抽屉'),
      ),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('标题'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: null,
          tooltip: 'Search',
        ),
        IconButton(
          icon: Icon(Icons.access_time),
          onPressed: null,
          tooltip: 'Time',
        ),
      ],
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  child: Text('头像'),
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.lightGreenAccent),
          ),
          ListTile(
            title: Text('Item 1'),
            leading: CircleAvatar(
              child: Icon(Icons.school),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            leading: CircleAvatar(
              child: Icon(Icons.list),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Builder _body() {
    return Builder(builder: (BuildContext context) {
      return Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('显示snackbar （Text 没有 onPressed 属性）'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('我是snackbar'),
                ));
              },
            ),
            RaisedButton(
              child: Text('显示BottomSheet （Text 没有 onPressed 属性）'),
              onPressed: () {
                Scaffold.of(context).showBottomSheet((BuildContext context) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        title: Text('Item 1'),
                        leading: new CircleAvatar(
                          child: new Icon(Icons.school),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        leading: new CircleAvatar(
                          child: new Text('B2'),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Item 3'),
                        leading: new CircleAvatar(
                          child: new Icon(Icons.list),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
              },
            ),
          ],
        ),
      );
    });
  }

}

class _BottomNavigationBar extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BottomNavigationBarFullDefault();
  }

  _BottomNavigationBar():super();

}

class _BottomNavigationBarFullDefault extends State{

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24.0,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      fixedColor: Colors.teal,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('主页')),
        BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('发现')),
        BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),title: Text('我的')),
      ],
    );
  }


  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });

    }
  }
}
