import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CommonWebView extends StatefulWidget {
  final String title;
  final String url;

  CommonWebView(this.title, this.url);

  @override
  State<StatefulWidget> createState() {
    return _CommonWebViewState();
  }
}

class _CommonWebViewState extends State<CommonWebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      withZoom: true,
      withLocalStorage: true,
    );
  }
}
