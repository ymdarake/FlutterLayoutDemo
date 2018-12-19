import '../model/News.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const hostMachineLoopBackAddress = 'http://10.0.2.2';
const port = '5000';

class NewsApi {

  Future<List<News>> fetchNewsList() async {
    final response = await http.get('$hostMachineLoopBackAddress:$port', headers: {
      'accept': 'application/json'
    });

    if (response.statusCode == 200) {
      var newsList = (json.decode(response.body) as List).map((news) {
        return News.fromJson(news);
      }).toList();
      return newsList;
    }
    return <News>[];
  }

}
