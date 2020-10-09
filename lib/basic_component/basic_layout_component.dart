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

              CustomButton(FluroRouter.containerIntro, 'Container简单介绍与使用', Colors.cyan),
              CustomButton(FluroRouter.paddingIntro, 'Padding简单介绍与使用', Colors.pink),
              CustomButton(FluroRouter.alignIntro, 'Align、Center简单介绍与使用', Colors.purple),
              CustomButton(FluroRouter.fittedBoxIntro, 'FittedBox简单介绍与使用', Colors.lightGreen),
              CustomButton(FluroRouter.aspectRatioIntro, 'AspectRatio简单介绍与使用', Colors.lightBlue),
              CustomButton(FluroRouter.baseLineIntro, 'BaseLine简单介绍与使用', Colors.grey),
              CustomButton(FluroRouter.fractionallySizeBoxIntro, 'FractionallySizeBox简单介绍与使用', Colors.indigo),
              CustomButton(FluroRouter.intrinsicIntro, 'Intrinsic简单介绍与使用', Colors.orange),
              CustomButton(FluroRouter.limitedBoxIntro, 'LimitedBox简单介绍与使用', Colors.yellow),
              CustomButton(FluroRouter.offstageIntro, 'Offstage简单介绍与使用', Colors.amber),
              CustomButton(FluroRouter.transformIntro, 'Transform简单介绍与使用', Colors.brown),
              CustomButton(FluroRouter.flowIntro, 'FlowIntro简单介绍与使用', Colors.deepPurple),
              RaisedButton(
                onPressed: () {
                  FluroRouter.navigateToMain(context);
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
