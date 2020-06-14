//PLain Old Dart Object file for the json structure

class Urls {
  String self;
  String next;
  String prev;

  Urls({this.self, this.next, this.prev});

  factory Urls.fromJson(dynamic jsonUrls) {
    return Urls(
        self: jsonUrls['self'] as String,
        next: jsonUrls['next'] as String,
        prev: jsonUrls['prev'] as String);
  }

  @override
  String toString() {
    return '{ ${this.self}, ${this.next}, ${this.prev} }';
  }
}

class Articles {
  String id;
  String url;
  String title;
  String text;
  String publisher;
  String author;
  String image;
  String date;

  Articles(
      {this.id,
      this.url,
      this.title,
      this.text,
      this.publisher,
      this.author,
      this.image,
      this.date});

  factory Articles.fromJson(dynamic jsonArticles) {
    return Articles(
      id: jsonArticles['id'] as String,
      url: jsonArticles['url'] as String,
      title: jsonArticles['title'] as String,
      text: jsonArticles['text'] as String,
      publisher: jsonArticles['publisher'] as String,
      author: jsonArticles['author'] as String,
      image: jsonArticles['image'] as String,
      date: jsonArticles['date'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.url}, ${this.title}, ${this.text}, '
        '${this.publisher}, ${this.author},${this.image},'
        '${this.date}';
  }
}

class Apple {
  int count;
  Urls url;
  List<Articles> articles;

  Apple(this.count, this.url, [this.articles]);

  factory Apple.fromJson(dynamic jsonApples) {
    if (jsonApples['articles'] != null) {
      var articleObjsJson = jsonApples['articles'] as List;
      List<Articles> _articles = articleObjsJson
          .map((articleJson) => Articles.fromJson(articleJson))
          .toList();

      return Apple(jsonApples['count'] as int, Urls.fromJson(jsonApples['url']),
          _articles);
    } else {
      return Apple(
          jsonApples['count'] as int, Urls.fromJson(jsonApples['url']));
    }
  }

  @override
  String toString() {
    return '{'
        ' ${this.count},'
        ' ${this.url}, '
        '${this.articles}'
        '}';
  }
}
