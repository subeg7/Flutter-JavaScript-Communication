import 'package:flutter/material.dart';
import 'package:flutter_js_communication/widgets/web_view_widget.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child: WebView(),
      ),
    );
  }
}
