import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/blog.dart';

class ApiService {
  final String baseUrl = "https://backend.abyssiniasoftware.com/api";

  // Fetch all blogs (GET request)
  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse('$baseUrl/blogs'));
    if (response.statusCode == 200) {
      try {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Blog.fromJson(json)).toList();
      } catch (e) {
        throw Exception('Failed to parse blogs: $e');
      }
    } else {
      throw Exception(
          'Failed to load blogs: ${response.statusCode} ${response.reasonPhrase}');
    }
  }

  // Create a new blog (POST request)
  Future<void> createBlog(
      String title, String description, String date, String category) async {
    final response = await http.post(
      Uri.parse('$baseUrl/blogs'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'description': description,
        'date': date,
        'category': category,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception(
          'Failed to create blog: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
