import 'package:http/http.dart' as http;
import 'package:news_api/model/news_model.dart';


class ApiService {
  var client = http.Client();
  Future<News> getNews(String query) async {
    var response = await client.get(Uri.parse('https://newsapi.org/v2/everything?q=$query&apiKey=ca7ed6a8c3134ab6a5426dffd2320119'));

 if(response.statusCode == 200) {
   var jsonString = response.body;
   return newsFromJson(jsonString);
 }

  }
}