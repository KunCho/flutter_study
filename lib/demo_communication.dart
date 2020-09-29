import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Communication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CommunicationPage();
  }

}

class CommunicationPage extends StatefulWidget{

  @override
  CommunicationPageState createState() => CommunicationPageState();

  CommunicationPage({Key key}):super(key:key);

}

class CommunicationPageState extends State<CommunicationPage>{
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(dataShared),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSharedText();
  }


  getSharedText() async{
    var sharedData = await platform.invokeMethod('getSharedText');
    if(sharedData != null){
      setState(() {
        dataShared = sharedData;
      });
    }
  }

}
