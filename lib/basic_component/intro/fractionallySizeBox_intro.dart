
import 'package:flutter/material.dart';

class FractionallySizeBoxIntro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizeBox的简单介绍与使用'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('''
FractionallySizedBox控件会根据现有空间，来调整child的尺寸，所以说child就算设置了具体的尺寸数值，也不起作用。

FractionallySizedBox的布局行为主要跟它的宽高因子两个参数有关，当参数为null或者有具体数值的时候，布局表现不一样。当然，还有一个辅助参数alignment，作为对齐方式进行布局。

当设置了具体的宽高因子，具体的宽高则根据现有空间宽高 * 因子，有可能会超出父控件的范围，当宽高因子大于1的时候；
当没有设置宽高因子，则填满可用区域；

属性介绍：
alignment：对齐方式，不能为null。

widthFactor：宽度因子，跟之前介绍的控件类似，宽度乘以这个值，就是最后的宽度。

heightFactor：高度因子，用作计算最后实际高度的。

其中widthFactor和heightFactor都有一个规则

如果不为null，那么实际的最大宽高度则为child的宽高乘以这个因子；
如果为null，那么child的宽高则会尽量充满整个区域。

使用场景：当需要在一个区域里面取百分比尺寸的时候，可以使用这个，比方说，高度40%宽度70%的区域。当然，AspectRatio也可以达到近似的效果。

              '''),
              Container(
                color: Colors.blue,
                height: 150.0,
                width: 150.0,
                padding: const EdgeInsets.all(10.0),
                child: FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: 1.5,
                  heightFactor: 0.5,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(color: Colors.blue, width: 100.0),
                    Container(color: Colors.red, width: 50.0,height: 50.0,),
                    Container(color: Colors.yellow, width: 150.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}