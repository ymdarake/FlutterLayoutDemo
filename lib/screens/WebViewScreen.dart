import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      url: url,
    );
  }
}
