import 'dart:convert';
import 'package:http/http.dart' as http;
import 'episode_model.dart';

class ApiService {
  // Replace with the actual API URL
  final String apiUrl = "https://api.dattebayo.com/naruto/episodes";

  Future<List<Episode>> fetchEpisodes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((episodeJson) => Episode.fromJson(episodeJson)).toList();
    } else {
      throw Exception("Failed to load episodes");
    }
  }
}
