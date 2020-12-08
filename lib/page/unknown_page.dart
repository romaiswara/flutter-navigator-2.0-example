import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  UnknownPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown Page'),
      ),
      body: Center(
        child: Text('404 NOT FOUND'),
      ),
    );
  }
}
