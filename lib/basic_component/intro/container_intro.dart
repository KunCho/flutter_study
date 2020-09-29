import 'package:flutter/material.dart';

class ContainerIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Container的简单介绍与使用'),
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
          child: Container(
            child: Column(
              children: [
                Text(
                  '''
Container的简单介绍

Container在Flutter中太常见了。官方给出的简介，是一个结合了绘制（painting）、定位（positioning）以及尺寸（sizing）widget的widget。

可以得出几个信息，它是一个组合的widget，内部有绘制widget、定位widget、尺寸widget。后续看到的不少widget，都是通过一些更基础的widget组合而成的。

属性解析：
key：Container唯一标识符，用于查找更新。

alignment：控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式。

padding：decoration内部的空白区域，如果有child的话，child位于padding内部。padding与margin的不同之处在于，padding是包含在content内，而margin则是外部边界，设置点击事件的话，padding区域会响应，而margin区域不会响应。

color：用来设置container背景色，如果foregroundDecoration设置的话，可能会遮盖color效果。

decoration：绘制在child后面的装饰，设置了decoration的话，就不能设置color属性，否则会报错，此时应该在decoration中进行颜色的设置。

foregroundDecoration：绘制在child前面的装饰。

width：container的宽度，设置为double.infinity可以强制在宽度上撑满，不设置，则根据child和父节点两者一起布局。

height：container的高度，设置为double.infinity可以强制在高度上撑满。

constraints：添加到child上额外的约束条件。

margin：围绕在decoration和child之外的空白区域，不属于内容区域。

transform：设置container的变换矩阵，类型为Matrix4。

child：container中的内容widget。

Container算是目前项目中，最经常用到的一个widget。在实际使用过程中，笔者在以下情况会使用到Container，当然并不是绝对的，也可以通过其他widget来实现。

需要设置间隔（这种情况下，如果只是单纯的间隔，也可以通过Padding来实现）；
需要设置背景色；
需要设置圆角或者边框的时候（ClipRRect也可以实现圆角效果）；
需要对齐（Align也可以实现）；
需要设置背景图片的时候（也可以使用Stack实现）。
        ''',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
                Container(
                  constraints: BoxConstraints.expand(
                      height:
                          Theme.of(context).textTheme.display1.fontSize * 1.1 +
                              200),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.red),
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                      centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Hello World',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.black)),
//          transform: new Matrix4.rotationZ(0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
