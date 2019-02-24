import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget{
  final url;
  WebViewScreen({Key key, this.url}) : super(key: key);
  @override
  WebViewScreenState createState() => new WebViewScreenState();

}

class WebViewScreenState extends State<WebViewScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin(); 
  StreamSubscription<String> _onUrlChanged;

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    
    flutterWebviewPlugin.close();
  
    super.initState();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        
        flutterWebviewPlugin.reload();
      }
    });
  }
   @override
  void dispose() {
    
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: WebviewScaffold(
      key: _scaffoldKey,
      url: widget.url,
      withJavascript: true,
      withLocalStorage: false,
      ),
    );
  }
}