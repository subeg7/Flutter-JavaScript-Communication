import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  bool isJavascriptConnected = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: InAppWebView(
              initialFile: "assets/index.html",
              onWebViewCreated: (InAppWebViewController controller) {
                controller.addJavaScriptHandler(
                    handlerName: "connectionHandler",
                    callback: (args) {
                      _handleFirstConnection();
                    });

                controller.addJavaScriptHandler(
                    handlerName: "incrementHandler",
                    callback: (args) {
                      _increaseCounter();
                    });
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.blue,
            child: Column(
              children: [
                isJavascriptConnected
                    ? Text("$count")
                    : CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                Text(
                  isJavascriptConnected
                      ? "Javscript connection established"
                      : "Waiting for javascript connection",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _handleFirstConnection() {
    setState(() {
      isJavascriptConnected = true;
    });
  }

  _increaseCounter() {
    setState(() {
      count++;
    });
  }
}
