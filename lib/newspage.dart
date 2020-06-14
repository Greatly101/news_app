import 'package:flutter/material.dart';
import 'dart:convert';
import 'apple.dart';

class NewsAppPage extends StatefulWidget {
  @override
  _NewsAppPageState createState() => _NewsAppPageState();
}

class _NewsAppPageState extends State<NewsAppPage> {
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
                      title: Text(articles[index]['title']),
                      subtitle: Text(articles[index]['publisher']),
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
      ),
    );
  }
}
