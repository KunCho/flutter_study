
import 'package:flutter/material.dart';

class IntrinsicIntro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intrinsic的简单介绍与使用'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('''
IntrinsicHeight的作用是调整child到固定的高度。
IntrinsicHeight这个控件的作用，是将可能高度不受限制的child，调整到一个合适并且合理的尺寸。
属性：除了child，没有提供额外的属性。

IntrinsicWidth从描述看，跟IntrinsicHeight类似，一个是调整高度，一个是调整宽度。同样是会存在效率问题，能别使用就尽量别使用。

IntrinsicWidth不同于IntrinsicHeight，它包含了额外的两个参数，stepHeight以及stepWidth。而IntrinsicWidth的布局行为跟这两个参数相关。

当stepWidth不是null的时候，child的宽度将会是stepWidth的倍数，当stepWidth值比child最小宽度小的时候，这个值不起作用；
当stepWidth为null的时候，child的宽度是child的最小宽度；
当stepHeight不为null的时候，效果跟stepWidth相同；
当stepHeight为null的时候，高度取最大高度。
              '''),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(color: Colors.blue, width: 100.0),
                    Container(color: Colors.red, width: 50.0,height: 50.0,),
                    Container(color: Colors.yellow, width: 150.0),
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                padding: const EdgeInsets.all(5.0),
                child: new IntrinsicWidth(
                  stepHeight: 450.0,
                  stepWidth: 300.0,
                  child: new Column(
                    children: <Widget>[
                      Container(color: Colors.blue, height: 100.0),
                      Container(color: Colors.red, width: 150.0, height: 100.0),
                      Container(color: Colors.yellow, height: 150.0,),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

}