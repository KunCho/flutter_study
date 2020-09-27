
import 'package:flutter/material.dart';

class BaseLineIntro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BaseLine的简单介绍与使用'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('''
Baseline这个控件，做过移动端开发的都会了解过，一般文字排版的时候，可能会用到它。它的作用很简单，根据child的baseline，来调整child的位置。例如两个字号不一样的文字，希望底部在一条水平线上，就可以使用这个控件，是一个非常基础的控件。

Baseline控件布局行为分为两种情况：

如果child有baseline，则根据child的baseline属性，调整child的位置；
如果child没有baseline，则根据child的bottom，来调整child的位置。

baseline：baseline数值，必须要有，从顶部算。

baselineType：baseline类型，也是必须要有的，目前有两种类型：

alphabetic：对齐字符底部的水平线；
ideographic：对齐表意字符的水平线。

              '''),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Baseline(
                    baseline: 50.0,
                    baselineType: TextBaseline.alphabetic,//对齐字符底部水平线
                    child: Text(
                      '小号字体',
                      style: TextStyle(
                        fontSize: 15.0,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ),
                  Baseline(
                    baseline: 50.0,
                    baselineType: TextBaseline.alphabetic,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Baseline(
                    baseline: 50.0,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      '大号字体',
                      style: TextStyle(
                        fontSize: 35.0,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}