import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage(this.url);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Tu facultad"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(255, 89, 0, 1)),
        body: WebView(initialUrl: widget.url));
  }
}
