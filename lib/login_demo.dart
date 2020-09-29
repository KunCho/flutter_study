import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginDemoPage();
  }
}

class LoginDemoPage extends StatefulWidget {
  @override
  _LoginDemoState createState() {
    return _LoginDemoState();
  }
}

class _LoginDemoState extends State<LoginDemoPage> {
  //手机号码控制器
  TextEditingController phoneController = TextEditingController();

  //密码控制器
  TextEditingController passwordController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Image(
                  image: AssetImage('assets/image/ic_logo.png'),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Center(
                child: Text('智店通',style: TextStyle(color: Color(0xff404040),fontSize: 20),),
              ),),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFFFA6469),
                  ),

                  suffixIcon: IconButton(icon: Icon(Icons.close),color: Colors.grey ,onPressed: (){
                    phoneController.clear();
                  }),
                  hintText: '请输入手机号',
                  border: InputBorder.none,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Divider(),
            )
            ,
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: passwordController,
                obscureText: hidePassword, //设置密码隐藏
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFFFA6469),
                    ),
                    suffixIcon: IconButton(icon: Icon(hidePassword?Icons.remove_red_eye:Icons.show_chart),color: Colors.grey ,onPressed: (){
//                    passwordController.clear();
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    }),
                    hintText: '请输入密码',
                    fillColor: Color(0xFFFA6469),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Divider(),
            )
            ,
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
              child: RaisedButton(
                onPressed: () {
                  _login();
                },
                color: const Color(0xFFFA6469),
                textColor: const Color(0xFFffffff),
                child: Text('登录'),
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(10, 0, 30, 10),
              child: Text('忘记密码',textAlign: TextAlign.right,style: TextStyle(color: Colors.grey,fontSize: 12),),
            ),
            Padding(padding: const EdgeInsets.all(10),
              child: Text('智能药店管理 v1.1.0',textAlign: TextAlign.center,style: TextStyle(color: Color(0xffccccd2),fontSize: 12)),
            )
          ],
        ));
  }

  void _login() {
    if (phoneController.text.trim().length != 11) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('手机号码格式不对'),
                content: Text('请输入正确的手机号码'),
              ));
    } else if (passwordController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请输入密码'),
                content: Text('请输入密码'),
              ));
    } else {
      phoneController.clear();
      passwordController.clear();
//      Navigator.push(context, CupertinoPageRoute<void>(builder: (ctx) => Demo19()));
      /*Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Demo19();
      }));*/
//      Navigator.pushNamed(context, 'Demo19');
      Navigator.pushReplacementNamed(context, '/DemoPage');
    }
  }
}
