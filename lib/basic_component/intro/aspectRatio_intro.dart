import 'package:flutter/material.dart';

class AspectRatioIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio的简单介绍与使用'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('''
AspectRatio的作用是调整child到设置的宽高比。

AspectRatio的布局行为分为两种情况：

AspectRatio首先会在布局限制条件允许的范围内尽可能的扩展，widget的高度是由宽度和比率决定的，类似于BoxFit中的contain，按照固定比率去尽量占满区域。
如果在满足所有限制条件过后无法找到一个可行的尺寸，AspectRatio最终将会去优先适应布局限制条件，而忽略所设置的比率。 
              '''),
              Container(
                height: 200.0,
                width: 200.0,
                color: Colors.teal,
                child: AspectRatio(aspectRatio: 1.5,
                  child: Container(
                    color: Colors.red,
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
