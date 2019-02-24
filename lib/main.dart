import 'package:flutter/material.dart';
import "webviewScreen.dart";
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';


void main() {
  runApp(new MaterialApp(
    routes: {
      "/": (_) => new Home(),
    })
  );
} 

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  int _currentIndex = 0;
  
  Widget home;
  Widget currentPage;
  WebViewScreen webview_1, webview_2;
  List<Widget> pages;
   
  @override
  void initState() {
    home = Container(color: Colors.green);
    webview_1 = WebViewScreen(url: "https://google.com");
    webview_2 =WebViewScreen(url: "https://facebook.com");
    //flutterWebviewPlugin.close();
    pages = [home,
             webview_1,
             webview_2,
              ];
    currentPage = home;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: currentPage, 
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:  _currentIndex, 
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            currentPage = pages[value];
          });
          
        },

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            title: Text('Webview_ 1'),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.web),
            title: new Text('Webview_2'),
            backgroundColor: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
