class News {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final String date;
  final String author;
  final bool isFeatured;
  final String category;
  final String content;
  final List<String> tags;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.date,
    required this.author,
    this.isFeatured = false,
    this.category = '',
    this.content = '',
    this.tags = const [],
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      date: json['date'] ?? '',
      author: json['author'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
      category: json['category'] ?? '',
      content: json['content'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imgUrl': imgUrl,
      'date': date,
      'author': author,
      'isFeatured': isFeatured,
      'category': category,
      'content': content,
      'tags': tags,
    };
  }

  News copyWith({
    String? id,
    String? title,
    String? description,
    String? imgUrl,
    String? date,
    String? author,
    bool? isFeatured,
    String? category,
    String? content,
    List<String>? tags,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      date: date ?? this.date,
      author: author ?? this.author,
      isFeatured: isFeatured ?? this.isFeatured,
      category: category ?? this.category,
      content: content ?? this.content,
      tags: tags ?? this.tags,
    );
  }

  @override
  String toString() {
    return 'News(id: $id, title: $title, description: $description, date: $date, author: $author, isFeatured: $isFeatured)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is News && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
