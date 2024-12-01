class NewsModel {
  List<Articles>? articles;

  NewsModel({this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }
}

class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  Articles({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
  }
}


