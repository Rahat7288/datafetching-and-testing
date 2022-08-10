import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

class NewsApiProvider{
  Client client = Client();

  Future<List<int>>fetchTopIds() async{
      final response = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
      final ids = json.decode(response.body);
      return ids.cast<int>();
  }
  Future<ItemModel>fetchItem(int id) async{
      final response = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'));
      final parsedJson = json.decode(response.body);
      return ItemModel.fromJson(parsedJson);

  }
}