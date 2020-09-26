import 'package:flutter/material.dart';

class PaddingIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Padding的简单介绍与使用'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFF3F3F3),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('''
                Padding在Flutter中用的也挺多的，作为一个基础的控件，功能非常单一，给子节点设置padding属性。写过其他端的都了解这个属性，就是设置内边距属性，内边距的空白区域，也是widget的一部分。
                
                Padding的布局分为两种情况：

                当child为空的时候，会产生一个宽为left+right，高为top+bottom的区域；
                当child不为空的时候，Padding会将布局约束传递给child，根据设置的padding属性，缩小child的布局尺寸。然后Padding将自己调整到child设置了padding属性的尺寸，在child周围创建空白区域。

                Padding 使用场景
                Padding本身还是挺简单的，基本上需要间距的地方，它都能够使用。如果在单一的间距场景，使用Padding比Container的成本要小一些，毕竟Container里面包含了多个widget。Padding能够实现的，Container都能够实现，只不过，Container更加的复杂。
                ''')
            ],
          ),
        ),
      ),
    );
  }
}
