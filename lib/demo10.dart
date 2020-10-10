import 'package:flutter/material.dart';
class Demo10 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }

}

class ScrollHomePageState extends State with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    super.initState();
    ///这里的 3 代表有三个子 Item
    ///应用到 TabBarView 中，对应其中3个子Item
    ///应用到 TabBar中，对应其中32上子Item
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('配置'),
      ),
      body: buildNestedScrollView(),
    );
  }

  NestedScrollView buildNestedScrollView(){
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context,bool b){
        return [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: buildFlexibleSpaceBar(),
            bottom: buildTabBar(),
          )
        ];
      },
      body: buildTabBarView(),
    );
  }
  
  TabBarView buildTabBarView(){
    return TabBarView(
      controller: tabController,
      children: [
      SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          child: Text("这是第一个页面"),
//          height: 1000,
//          color: Colors.lime,
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        ),
      ),
      Text(
        '第二个页面',
        style: TextStyle(color: Colors.blue),
      ),
      Text(
        '第三个页面',
        style: TextStyle(color: Colors.red),
      ),
    ],
    );
  }

  TabBar buildTabBar(){
    return TabBar(tabs: [
      Tab(text: '标签1',),
      Tab(text: '标签2',),
      Tab(text: '标签3',)
    ],
      controller: tabController,
    );
  }

  String imageUrl =
      "https://timgsa.baidu.com/timg?demo.image&quality=80&size=b9999_10000&sec=1578583093&di=0bf687d9589dc5c6c0778de9576ee077&imgtype=jpg&er=1&src=http%3A%2F%2Ffile.mumayi.com%2Fforum%2F201403%2F28%2F111010vhgc45hkh41f1mfd.jpg";

  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
//                title: Text("FlexibleSpaceBar title"),
      centerTitle: true,
      background: Container(
        color: Color(0xffda4c3d),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 150,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                height: 160,
                width: 400,
              ),
            ),
          ],
        ),
      ),
    );
  }


}





/*class Demo10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo10'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {},
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.teal),
                  borderRadius: BorderRadius.circular(100)),
              child: Text('灵犀'),
            ),
            ClipRect(

              child: Align(
                alignment: Alignment.topCenter,
//                heightFactor: 0.5,//图片裁剪一半仅仅显示上半部分

                child: Image(
                  image: AssetImage('assets/image/ic_store.png'),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('assets/image/ic_store.png'),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}*/
