class MenuProducto {
  final String id;
  final String name;
  final String description;
  final String imgUrl;
  final double price;
  final String category;
  final bool isAvailable;
  final List<String> ingredients;
  final String preparationTime;

  MenuProducto({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.category,
    this.isAvailable = true,
    this.ingredients = const [],
    this.preparationTime = '',
  });

  factory MenuProducto.fromJson(Map<String, dynamic> json) {
    return MenuProducto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      category: json['category'] ?? '',
      isAvailable: json['isAvailable'] ?? true,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      preparationTime: json['preparationTime'] ?? '',
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
    };
  }

  MenuProducto copyWith({
    String? id,
    String? name,
    String? description,
    String? imgUrl,
    double? price,
    String? category,
    bool? isAvailable,
    List<String>? ingredients,
    String? preparationTime,
  }) {
    return MenuProducto(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      ingredients: ingredients ?? this.ingredients,
      preparationTime: preparationTime ?? this.preparationTime,
    );
  }

  @override
  String toString() {
    return 'MenuProducto(id: $id, name: $name, description: $description, price: $price, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuProducto && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
