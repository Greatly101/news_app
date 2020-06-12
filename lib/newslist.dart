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

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    text = json['text'];
    publisher = json['publisher'];
    author = json['author'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'title': title,
        'text': text,
        'publisher': publisher,
        'image': image,
        'date': date
      };
}
