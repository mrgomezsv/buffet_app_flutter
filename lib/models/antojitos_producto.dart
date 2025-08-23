class AntojitosProducto {
  final String id;
  final String name;
  final String description;
  final String imgUrl;
  final double price;
  final String category;
  final bool isAvailable;
  final List<String> ingredients;
  final String preparationTime;
  final bool isSpicy;
  final String size;

  AntojitosProducto({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.category,
    this.isAvailable = true,
    this.ingredients = const [],
    this.preparationTime = '',
    this.isSpicy = false,
    this.size = 'Regular',
  });

  factory AntojitosProducto.fromJson(Map<String, dynamic> json) {
    return AntojitosProducto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      category: json['category'] ?? '',
      isAvailable: json['isAvailable'] ?? true,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      preparationTime: json['preparationTime'] ?? '',
      isSpicy: json['isSpicy'] ?? false,
      size: json['size'] ?? 'Regular',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imgUrl': imgUrl,
      'price': price,
      'category': category,
      'isAvailable': isAvailable,
      'ingredients': ingredients,
      'preparationTime': preparationTime,
      'isSpicy': isSpicy,
      'size': size,
    };
  }

  AntojitosProducto copyWith({
    String? id,
    String? name,
    String? description,
    String? imgUrl,
    double? price,
    String? category,
    bool? isAvailable,
    List<String>? ingredients,
    String? preparationTime,
    bool? isSpicy,
    String? size,
  }) {
    return AntojitosProducto(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      ingredients: ingredients ?? this.ingredients,
      preparationTime: preparationTime ?? this.preparationTime,
      isSpicy: isSpicy ?? this.isSpicy,
      size: size ?? this.size,
    );
  }

  @override
  String toString() {
    return 'AntojitosProducto(id: $id, name: $name, description: $description, price: $price, category: $category, isSpicy: $isSpicy, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AntojitosProducto && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
