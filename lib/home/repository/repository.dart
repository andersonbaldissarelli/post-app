import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:post_api/home/models/post_model.dart';

class HomeRepository {
  List<Post> posts = [];

  Future getPosts() async {
    final baseURL = "http://jsonplaceholder.typicode.com";
    var url = Uri.parse(
      '$baseURL/posts',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      posts = json.map((e) => Post.fromJson(e)).toList();

      return posts;
    }
  }
}
