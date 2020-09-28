import 'package:flutter/material.dart';
import 'package:flutter_study/custom_button.dart';

class BasicLayoutComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('基础布局控件',),
      ),
      body: Container(
        color: Color(0xFFF3F3F3),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton('/ContainerIntro', 'Container简单介绍与使用', Colors.cyan),
              CustomButton('/PaddingIntro', 'Padding简单介绍与使用', Colors.pink),
              CustomButton('/AlignIntro', 'Align、Center简单介绍与使用', Colors.purple),
              CustomButton('/FittedBoxIntro', 'FittedBox简单介绍与使用', Colors.lightGreen),
              CustomButton('/AspectRatioIntro', 'AspectRatio简单介绍与使用', Colors.lightBlue),
              CustomButton('/BaseLineIntro', 'BaseLine简单介绍与使用', Colors.grey),
              CustomButton('/FractionallySizeBoxIntro', 'FractionallySizeBox简单介绍与使用', Colors.indigo),
              CustomButton('/IntrinsicIntro', 'Intrinsic简单介绍与使用', Colors.orange),
              CustomButton('/LimitedBoxIntro', 'LimitedBox简单介绍与使用', Colors.yellow),
              CustomButton('/OffstageIntro', 'Offstage简单介绍与使用', Colors.amber),
              CustomButton('/TransformIntro', 'Transform简单介绍与使用', Colors.brown),
            ],
          ),
        ),
      ),
    );
  }
}
