import 'package:flutter/material.dart';
import 'package:newsapp/newslist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class NewsAppPage extends StatefulWidget {
  @override
  _NewsAppPageState createState() => _NewsAppPageState();
}

class _NewsAppPageState extends State<NewsAppPage> {
  List<Articles> _articles = List<Articles>();

  Future<List<Articles>> fetchArticles() async {
    var articles = List<Articles>();

    var url = 'https://localhost';

    //Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //get jsn data
      final articlesJson = json.decode(response.body);
      //assign data to articles list variable
      for (var articlesJson in articlesJson) {
        articles.add(Articles.fromJson(articlesJson));
      }
    }
    return articles;
  }

  @override
  void initState() {
    fetchArticles().then((value) {
      setState(() {
        _articles.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //title: Text(_articles[index].title),
                //subtitle: Text(_articles[index].publisher),
                title: Text('NEWS'),
                subtitle: Text('subsub'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            );
          },
          itemCount: _articles.length,
          // itemCount: 10,
        ),
      ),
    );
  }
}
