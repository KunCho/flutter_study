import 'package:flutter/material.dart';

class Demo18 extends StatelessWidget {
  final List<String> items;

  Demo18({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return new MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
//            if (index.isOdd) {
//              return new Divider();
//            }
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                items.removeAt(index);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              child: ListTile(
                title: Text('$item'),
              ),
              background: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "删除",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )),
              secondaryBackground: Container(
                color: Colors.lightGreen,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      '删除',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
