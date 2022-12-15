import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({super.key});

  // final Completer<WebViewController> controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  late WebViewController _controller;
  var loadingPercentage = 0;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://www.nytimes.com/',
              javascriptMode: JavascriptMode.unrestricted,
              // onWebViewCreated: (WebViewController webViewController) {
              //   _controller = webViewController;
              // },
              // onPageStarted: (url) {
              //   setState(() {
              //     loadingPercentage = 0;
              //   });
              // },
              // onProgress: (progress) {
              //   setState(() {
              //     loadingPercentage = progress;
              //   });
              // },
              // onPageFinished: (url) {
              //   setState(() {
              //     loadingPercentage = 100;
              //   });
              // },
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ),
      ),
    );
  }
}
