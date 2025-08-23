class Buffet {
  final String id;
  final String name;
  final String description;
  final String imgUrl;
  final double price;
  final String category;
  final bool isAvailable;
  final List<String> menuItems;
  final String duration;
  final int minGuests;
  final int maxGuests;
  final List<String> includes;
  final String specialNotes;

  Buffet({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.category,
    this.isAvailable = true,
    this.menuItems = const [],
    this.duration = '',
    this.minGuests = 1,
    this.maxGuests = 100,
    this.includes = const [],
    this.specialNotes = '',
  });

  factory Buffet.fromJson(Map<String, dynamic> json) {
    return Buffet(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      category: json['category'] ?? '',
      isAvailable: json['isAvailable'] ?? true,
      menuItems: List<String>.from(json['menuItems'] ?? []),
      duration: json['duration'] ?? '',
      minGuests: json['minGuests'] ?? 1,
      maxGuests: json['maxGuests'] ?? 100,
      includes: List<String>.from(json['includes'] ?? []),
      specialNotes: json['specialNotes'] ?? '',
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
      'duration': duration,
      'minGuests': minGuests,
      'maxGuests': maxGuests,
      'includes': includes,
      'specialNotes': specialNotes,
    };
  }

  Buffet copyWith({
    String? id,
    String? name,
    String? description,
    String? imgUrl,
    double? price,
    String? category,
    bool? isAvailable,
    List<String>? menuItems,
    String? duration,
    int? minGuests,
    int? maxGuests,
    List<String>? includes,
    String? specialNotes,
  }) {
    return Buffet(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      menuItems: menuItems ?? this.menuItems,
      duration: duration ?? this.duration,
      minGuests: minGuests ?? this.minGuests,
      maxGuests: maxGuests ?? this.maxGuests,
      includes: includes ?? this.includes,
      specialNotes: specialNotes ?? this.specialNotes,
    );
  }

  @override
  String toString() {
    return 'Buffet(id: $id, name: $name, description: $description, price: $price, category: $category, minGuests: $minGuests, maxGuests: $maxGuests)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Buffet && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
