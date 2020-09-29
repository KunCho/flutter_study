import 'package:flutter/material.dart';

class Demo10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo10'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {},
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.teal),
                  borderRadius: BorderRadius.circular(100)),
              child: Text('灵犀'),
            ),
            ClipRect(

              child: Align(
                alignment: Alignment.topCenter,
//                heightFactor: 0.5,//图片裁剪一半仅仅显示上半部分

                child: Image(
                  image: AssetImage('assets/image/ic_store.png'),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('assets/image/ic_store.png'),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
