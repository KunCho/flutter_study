import 'package:flutter/material.dart';

class MessageDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog(
      {Key key,
      @required this.title,
      @required this.message,
      this.negativeText,
      this.positiveText,
      @required this.onCloseEvent,
      this.onPositivePressEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),color: Color(0xffffffff)),
              margin: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Center(
                          child: Text(title,style: TextStyle(fontSize: 19.0),),
                        ),
                        GestureDetector(
                          onTap: this.onCloseEvent,
                          child: Padding(padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.close,color: Color(0xffe0e0e0),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  Container(
                    constraints: BoxConstraints(minHeight: 120.0),
                    child: Padding(padding: EdgeInsets.all(12.0),
                      child: IntrinsicHeight(
                        child: Text(message,style: TextStyle(fontSize: 16.0),),
                      ),
                    ),
                  ),
                  this._buildBottomButtonGroup()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup(){
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty) widgets.add(_buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty) widgets.add(_buildBottomPositiveButton());
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color: Color(Colors.teal.value),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
