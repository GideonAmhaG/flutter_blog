class Blog {
  final int id;
  final String title;
  final String description;
  final String date;
  final String category;

  Blog(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.category});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      category: json['category'],
    );
  }
}
