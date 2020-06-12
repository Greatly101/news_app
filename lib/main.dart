import 'package:flutter/material.dart';
//import 'page.dart';
import 'newspage.dart';

import 'package:newsapp/newslist.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QodHub Internship Challenge',
      debugShowCheckedModeBanner: false,
      home: NewsAppPage(),
    );
  }
}
