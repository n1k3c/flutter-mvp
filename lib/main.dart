import 'package:flutter/material.dart';
import 'package:flutter_mvp/features/home/home_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder> {
        Home.routeName: (BuildContext context) => new Home(),
      },
      home: new Home(),
    );
  }
}
