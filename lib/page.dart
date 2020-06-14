import 'package:flutter/material.dart';
import 'apple.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async' show Future;

class NewsAppPage extends StatefulWidget {
  @override
  _NewsAppPageState createState() => _NewsAppPageState();
}

class _NewsAppPageState extends State<NewsAppPage> {
  // String jsonFile = "assets/Apple.json";

  // Apple jsonData = Apple.fromJson(json.decode(this.jsonFile));

  List<Articles> _articles = List<Articles>();

  Future<List<Articles>> fetchArticles() async {
    var url = 'https://greatly101.github.io/jsonserver/Apple.json';

    //Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    var articles = List<Articles>();

    if (response.statusCode == 200) {
      //get jsn data
      var articlesJson = json.decode(response.body);
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
        body: Center(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/Apple.json"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  //print(snapshot.data['title']);
                  print(snapshot.data.toString());
                }
              }
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              final articles = jsonDecode(snapshot.data.toString());
              // print(articles);

              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(articles[index].title),
                      subtitle: Text(articles[index].publisher),
                      //title: Text(('news')),
                      //subtitle: Text('newsnews'),

                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  );
                },
                itemCount: articles.length,
              );
            },
          ),
        ),
        /*ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //title: Text(_articles[index].title),
                // subtitle: Text(_articles[index].publisher),
                title: Text('NEWS'),
                subtitle: Text('subsub'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            );
          },
          itemCount: art.length,
          // itemCount: 10,
        ),*/
      ),
    );
  }
}
