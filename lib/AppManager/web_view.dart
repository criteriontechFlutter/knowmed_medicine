
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';




class WebViewPage extends StatefulWidget {
  final String title;
  final String url;
  const WebViewPage({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:   WebView(
          initialUrl: widget.url.toString(),
          // initialUrl: "https://digidoctor.in/Home/AboutUs",
        )
      ),
    );
  }
}
