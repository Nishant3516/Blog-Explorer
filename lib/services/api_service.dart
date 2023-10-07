import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blogexplorer/models/blog_model.dart';

class ApiService {
  static Future<List<Blog>> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> blogsList = data['blogs'];

        if (blogsList != null) {
          final List<Blog> blogs =
              blogsList.map((json) => Blog.fromJson(json)).toList();
          return blogs;
        } else {
          throw Exception('API response does not contain "blogs" list');
        }
      } else {
        throw Exception(
            'Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
