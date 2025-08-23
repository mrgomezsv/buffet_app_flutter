class Lunch {
  final String id;
  final String name;
  final String description;
  final String imgUrl;
  final double price;
  final String category;
  final bool isAvailable;
  final List<String> menuItems;
  final String mealTime;
  final String dietaryInfo;
  final List<String> allergens;
  final String preparationTime;

  Lunch({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.category,
    this.isAvailable = true,
    this.menuItems = const [],
    this.mealTime = '',
    this.dietaryInfo = '',
    this.allergens = const [],
    this.preparationTime = '',
  });

  factory Lunch.fromJson(Map<String, dynamic> json) {
    return Lunch(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      category: json['category'] ?? '',
      isAvailable: json['isAvailable'] ?? true,
      menuItems: List<String>.from(json['menuItems'] ?? []),
      mealTime: json['mealTime'] ?? '',
      dietaryInfo: json['dietaryInfo'] ?? '',
      allergens: List<String>.from(json['allergens'] ?? []),
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
      'menuItems': menuItems,
      'mealTime': mealTime,
      'dietaryInfo': dietaryInfo,
      'allergens': allergens,
      'preparationTime': preparationTime,
    };
  }

  Lunch copyWith({
    String? id,
    String? name,
    String? description,
    String? imgUrl,
    double? price,
    String? category,
    bool? isAvailable,
    List<String>? menuItems,
    String? mealTime,
    String? dietaryInfo,
    List<String>? allergens,
    String? preparationTime,
  }) {
    return Lunch(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      menuItems: menuItems ?? this.menuItems,
      mealTime: mealTime ?? this.mealTime,
      dietaryInfo: dietaryInfo ?? this.dietaryInfo,
      allergens: allergens ?? this.allergens,
      preparationTime: preparationTime ?? this.preparationTime,
    );
  }

  @override
  String toString() {
    return 'Lunch(id: $id, name: $name, description: $description, price: $price, category: $category, mealTime: $mealTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Lunch && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
