class TheoryModel {
  final String id;
  final String title;
  final String content;
  final String category;
  final String author;
  final DateTime createdAt;
  final int likes;

  TheoryModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.author,
    required this.createdAt,
    this.likes = 0,
  });

  factory TheoryModel.fromJson(Map<String, dynamic> json) {
    return TheoryModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
      author: json['author'],
      createdAt: DateTime.parse(json['createdAt']),
      likes: json['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'author': author,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes,
    };
  }
}
