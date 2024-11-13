import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/blog.dart';

class BlogsListScreen extends StatefulWidget {
  @override
  _BlogsListScreenState createState() => _BlogsListScreenState();
}

class _BlogsListScreenState extends State<BlogsListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Blog>> blogs;

  @override
  void initState() {
    super.initState();
    blogs = apiService.fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blogs List')),
      body: FutureBuilder<List<Blog>>(
        future: blogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No blogs found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Blog blog = snapshot.data![index];
              return ListTile(
                title: Text(blog.title),
                subtitle: Text(blog.description),
              );
            },
          );
        },
      ),
    );
  }
}
