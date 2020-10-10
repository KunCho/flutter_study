import 'package:flutter/material.dart';
import 'package:flutter_study/custom_button.dart';
import 'package:flutter_study/route/router.dart';

class BasicLayoutComponent extends StatelessWidget {
  final String pageTitle;

  BasicLayoutComponent({@required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$pageTitle',),
      ),
      body: Container(
        color: Color(0xFFF3F3F3),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [

              CustomButton(FluroRouters.containerIntro, 'Container简单介绍与使用', Colors.cyan),
              CustomButton(FluroRouters.paddingIntro, 'Padding简单介绍与使用', Colors.pink),
              CustomButton(FluroRouters.alignIntro, 'Align、Center简单介绍与使用', Colors.purple),
              CustomButton(FluroRouters.fittedBoxIntro, 'FittedBox简单介绍与使用', Colors.lightGreen),
              CustomButton(FluroRouters.aspectRatioIntro, 'AspectRatio简单介绍与使用', Colors.lightBlue),
              CustomButton(FluroRouters.baseLineIntro, 'BaseLine简单介绍与使用', Colors.grey),
              CustomButton(FluroRouters.fractionallySizeBoxIntro, 'FractionallySizeBox简单介绍与使用', Colors.indigo),
              CustomButton(FluroRouters.intrinsicIntro, 'Intrinsic简单介绍与使用', Colors.orange),
              CustomButton(FluroRouters.limitedBoxIntro, 'LimitedBox简单介绍与使用', Colors.yellow),
              CustomButton(FluroRouters.offstageIntro, 'Offstage简单介绍与使用', Colors.amber),
              CustomButton(FluroRouters.transformIntro, 'Transform简单介绍与使用', Colors.brown),
              CustomButton(FluroRouters.flowIntro, 'FlowIntro简单介绍与使用', Colors.deepPurple),
              RaisedButton(
                onPressed: () {
                  FluroRouters.navigateToMain(context);
//                Routes
                },
                child: Text(
                  '清栈返回',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
