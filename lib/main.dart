import 'package:flutter/material.dart';
//import 'page.dart';
import 'newspage.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge',
      debugShowCheckedModeBanner: false,
      home: NewsAppPage(),
    );
  }
}
