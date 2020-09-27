import 'package:flutter/material.dart';

class AlignIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align的简单介绍'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
//                alignment: const Alignment(1.0, 0.5),//居右高于底部1/4处
                child: Text('''
在其他端的开发，Align一般都是当做一个控件的属性，并没有拿出来当做一个单独的控件。Align本身实现的功能并不复杂，设置child的对齐方式，例如居中、居左居右等，并根据child尺寸调节自身尺寸。
            
布局行为：

当widthFactor和heightFactor为null的时候，当其有限制条件的时候，Align会根据限制条件尽量的扩展自己的尺寸，当没有限制条件的时候，会调整到child的尺寸；
当widthFactor或者heightFactor不为null的时候，Aligin会根据factor属性，扩展自己的尺寸，例如设置widthFactor为2.0的时候，那么，Align的宽度将会是child的两倍。

属性解析：

alignment：对齐方式，一般会使用系统默认提供的9种方式，但是并不是说只有这9种。系统提供的9种方式只是预先定义好的。
Alignment实际上是包含了两个属性的，其中第一个参数，-1.0是左边对齐，1.0是右边对齐，第二个参数，-1.0是顶部对齐，1.0是底部对齐。根据这个规则，我们也可以自定义我们需要的对齐方式。
/// 居右高于底部1/4处.
static const Alignment rightHalfBottom = alignment: const Alignment(1.0, 0.5)。

使用场景：
一般在对齐场景下使用，例如需要右对齐或者底部对齐之类的。它能够实现的功能，Container都能实现。

另外相关组件：
Center继承自Align，只不过是将alignment设置为Alignment.center，其他属性例如widthFactor、heightFactor，布局行为，都与Align完全一样，在这里就不再单独做介绍了。Center源码如下，没有设置alignment属性，是因为Align默认的对齐方式就是居中。
            '''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
