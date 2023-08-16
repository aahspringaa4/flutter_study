import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';
import '../models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";
  static const String episodes = "episodes";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for(var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/$episodes");
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final episode = jsonDecode(response.body);
      for(var episodes in episode) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episodes));
      }
      return episodesInstances;
    }
    throw Error();
  }
}