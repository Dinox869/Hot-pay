import 'package:flutter/material.dart';
class View extends StatelessWidget {
  final String title;
  View(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text ("Food"),
      ),
      body: new Center(
        child: new Text (""),
      ),
    );
  }


}