import 'dart:async';
import 'dart:io';

//import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

//var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));
BaseOptions options = new BaseOptions(
    baseUrl: 'https://www.wanandroid.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: optHeader);
var dio = new Dio(options)
..interceptors.add(LogInterceptor(requestBody: false));//打开请求日志
//dio

class NetUtils {
  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;

    // 设置代理 便于本地 charles 抓包
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 30.10.26.193:8888";
    //   };
    // };

    Directory documentsDir =
        await getApplicationDocumentsDirectory(); //获取文档目录的路径
    String documentsPath = documentsDir.path;
    print('==========documentsPath start============');
    print(documentsPath);
    print('==========documentsPath end============');
    var dir = Directory("$documentsPath/cookies");
    await dir.create();
    // print('documentPath:${dir.path}');
//    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));

    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    print('网络走到了这里start');
    print(response.data);
    print('网络走到了这里end');
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    /*dio.options.baseUrl = 'https://www.wanandroid.com';
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;*/
    var response = await dio.post(url, data: params);
    return response.data;
  }

  static Future download(String url, String savePath) async {
    var download = dio.download(url, savePath);
    return download;
  }

  static Future onSend(String url, String savePath) async {
//    dio.interceptors.request.onSend=;
  }
}
