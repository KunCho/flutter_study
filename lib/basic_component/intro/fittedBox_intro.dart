import 'package:flutter/material.dart';

class FittedBoxIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox的简单介绍与使用'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('''
由于FittedBox是一个容器，需要让其child在其范围内缩放，因此其布局行为分两种情况：

如果外部有约束的话，按照外部约束调整自身尺寸，然后缩放调整child，按照指定的条件进行布局；
如果没有外部约束条件，则跟child尺寸一致，指定的缩放以及位置属性将不起作用。

属性介绍：
fit：缩放的方式，默认的属性是BoxFit.contain，child在FittedBox范围内，尽可能的大，但是不超出其尺寸。这里注意一点，contain是保持着child宽高比的大前提下，尽可能的填满，一般情况下，宽度或者高度达到最大值时，就会停止缩放。
alignment：对齐方式，默认的属性是Alignment.center，居中显示child。

FittedBox在目前的项目中还未用到过。对于需要缩放调整位置处理的，一般都是图片。笔者一般都是使用Container中的decoration属性去实现相应的效果。对于其他控件需要缩放以及调整位置的，目前还没有遇到使用场景，大家只需要知道有这么一个控件，可以实现这个功能即可。
              '''),
              Container(
                color: Colors.amberAccent,
                width: 300.0,
                height: 300.0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.red,
                    child: Text("FittedBox"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
