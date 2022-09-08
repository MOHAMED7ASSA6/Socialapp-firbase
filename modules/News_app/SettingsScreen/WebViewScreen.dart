import 'package:flutter/material.dart';



class WebViewScreen extends StatelessWidget {
  final String? url;
  WebViewScreen({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewScreen(
        url: url,
      ),
    );
  }}
