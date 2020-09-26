import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Demo15 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: new Stack(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: 'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true'),
          )
        ],
      ),
    );
  }
  
  
}
