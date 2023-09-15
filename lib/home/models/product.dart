// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String id;
  final String name;
  final int price;
  final String description;
  final double productRating;
  final List<String> category;
  final List<String> images;
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.productRating,
    required this.category,
    required this.images,
  });

  Product copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    double? productRating,
    List<String>? category,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      productRating: productRating ?? this.productRating,
      category: category ?? this.category,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'productRating': productRating,
      'category': category,
      'images': images,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      productRating: json['product_rating'] as double,
      category: List<String>.from((json['category'] as List<dynamic>)),
      images: List<String>.from((json['images'] as List<dynamic>)),
    );
  }
}
