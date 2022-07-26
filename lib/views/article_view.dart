import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? blogUrl;
  const ArticleView({Key? key,  this.blogUrl}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 231, 86, 86),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text(
            'DSM',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 0),
          ),
          Text(
            'News',
            style: TextStyle(color: Colors.grey),
          ),
        ],
        ),
        actions: [
          Opacity(opacity: 0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child:  Icon(Icons.save),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl:widget.blogUrl,
          onWebViewCreated: (WebViewController webViewController){
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}