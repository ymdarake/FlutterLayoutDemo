class News {
  final String link;
  final String title;
  final String date;

  News({this.link, this.title, this.date});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      link: json['link'],
      title: json['title'],
      date: json['date'],
    );
  }
}
