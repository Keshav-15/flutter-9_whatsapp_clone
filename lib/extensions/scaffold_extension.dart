import 'package:flutter/material.dart';

extension ScaffoldExtension on Widget {
  Scaffold homeScreenScaffold(
      {required String title, Widget? bottomNavigationBar}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: this,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
