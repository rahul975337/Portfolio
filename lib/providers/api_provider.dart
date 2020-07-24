import 'dart:convert';

import 'package:flutter_app4/config/constants.dart';
import 'package:flutter_app4/models/blog_model.dart';

class ApiProvider {
  var http;

  Future<List<Blog>> getBlogs() async {
    final response = await http.get(Constants.BLOG_API);
    if (response.statusCode == 200) {
      List blogs = json.decode(utf8.decode(response.bodyBytes))['response'];
      final results = blogs.map((blog) => Blog.fromJson(blog)).toList();
      return results;
    } else {
      return null;
    }
  }
}
